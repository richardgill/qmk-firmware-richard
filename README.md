# QMK Firmware - Richard's Cyboard Imprint

Custom QMK firmware patches for Cyboard Imprint keyboard with Colemak-DH and home row mods.

## Prerequisites

- [mise](https://mise.jdx.dev) - `mise install` to set up tools
- ARM toolchain:
  ```bash
  # NixOS
  nix-shell -p gcc-arm-embedded

  # Ubuntu/Debian
  sudo apt install gcc-arm-none-eabi

  # macOS
  brew install arm-none-eabi-gcc
  ```

## Usage

```bash
mise run build      # Reset, apply patches, build firmware
mise run generate   # Capture changes from clones/ as patches
```

Output: `clones/qmk_firmware/cyboard_imprint_imprint_number_row_full_bottom_row_default.uf2`

## Flashing

1. Tap reset button 2x with pen
2. Drag `.uf2` file to USB storage device

## Workflow

**Editing patches:**
1. Edit files in `patches/`
2. `mise run build` to verify

**Editing cloned repo directly:**
1. Make changes in `clones/qmk_firmware/`
2. `mise run generate` to capture as patches
3. `mise run build` to verify

