#!/usr/bin/env bash
set -euo pipefail

action="${1:-}"
variant="${2:-}"
keymap="${3:-default}"

find_rpi_rp2_device() {
  lsblk -prno PATH,LABEL | awk '$2 == "RPI-RP2" { print $1; exit }'
}

print_flash_port_warning() {
  local side="$1"
  echo
  echo "========================================"
  echo "FLASH ${side^^} HALF"
  echo "Use the RIGHT-SIDE USB port on the ${side} half (as you sit at the keyboard)."
  echo "Connect USB directly to this half while flashing."
  echo "Do not leave halves connected through master/slave during flashing."
  echo "========================================"
}

wait_for_rpi_rp2_mount() {
  local side="$1"
  local dev_path=""
  print_flash_port_warning "$side"
  echo "Put the ${side} half in boot mode now."
  until [[ -n "$dev_path" ]]; do
    dev_path="$(find_rpi_rp2_device)"
    [[ -n "$dev_path" ]] || sleep 0.2
  done

  if ! findmnt -rn -S "$dev_path" >/dev/null 2>&1; then
    if ! udisksctl mount -b "$dev_path" >/dev/null 2>&1; then
      echo "Auto-mount failed for $dev_path. Confirm USB is on the RIGHT-SIDE port of this half and connected directly, open in Nautilus, then press Enter."
      read -r _
    fi
  fi
}

wait_for_rpi_rp2_disconnect() {
  local tries=0
  echo "waiting for current boot drive to disconnect"
  while [[ -n "$(find_rpi_rp2_device)" && "$tries" -lt 50 ]]; do
    sleep 0.2
    tries=$((tries + 1))
  done

  if [[ -n "$(find_rpi_rp2_device)" ]]; then
    echo "Still seeing a boot drive. Unplug the current half, then plug the other half into its RIGHT-SIDE USB port (as you sit) in boot mode, then press Enter."
    read -r _
  fi
}

if [[ "$action" != "build" && "$action" != "flash" ]]; then
  echo "usage: bash ./scripts/cosmos-task.sh <build|flash> <1|2> [default|raw_matrix_scan]" >&2
  exit 1
fi

if [[ "$variant" != "1" && "$variant" != "2" ]]; then
  echo "variant must be 1 or 2" >&2
  exit 1
fi

if [[ "$keymap" != "default" && "$keymap" != "raw_matrix_scan" ]]; then
  echo "keymap must be default or raw_matrix_scan" >&2
  exit 1
fi

keyboard="cosmos/lemon/custom_${variant}"

if [[ "$action" == "build" ]]; then
  patchy repo reset --yes
  patchy apply --auto-commit all
  cd "$(patchy config get target_repo_path)"
  make "${keyboard}:${keymap}"
  exit 0
fi

cd "$(patchy config get target_repo_path)"
filesafe_keyboard="${keyboard//\//_}"
left_target="${filesafe_keyboard}_${keymap}_left"
right_target="${filesafe_keyboard}_${keymap}_right"

make "${keyboard}:${keymap}" "TARGET=${left_target}" "EXTRAFLAGS=-DINIT_EE_HANDS_LEFT"
cp "./.build/${left_target}.uf2" "./${left_target}.uf2"

make "${keyboard}:${keymap}" "TARGET=${right_target}" "EXTRAFLAGS=-DINIT_EE_HANDS_RIGHT"
cp "./.build/${right_target}.uf2" "./${right_target}.uf2"

echo "Starting Cosmos flash sequence: LEFT half first, then RIGHT half."
wait_for_rpi_rp2_mount left
./util/uf2conv.py --wait --deploy "./.build/${left_target}.uf2"

wait_for_rpi_rp2_disconnect
wait_for_rpi_rp2_mount right
./util/uf2conv.py --wait --deploy "./.build/${right_target}.uf2"

echo "saved firmware artifacts:"
echo "./${left_target}.uf2"
echo "./${right_target}.uf2"
