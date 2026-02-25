# Cosmos Lemon Pumpkin Patch WIP

This patch set adds a new keyboard target and keymaps under:

- `keyboards/cosmos/lemon`
- `keyboards/cosmos/lemon/pumpkin_patch`

Included keymaps:

- `default` (WIP real layout, includes base-layer `SAFE_BOOT` on both sides)
- `matrix_test` (`!row,col` key output)
- `raw_matrix_scan` (`+row,col` and `-row,col` transition output)

Bootloader entry from keymap (`SAFE_BOOT`):

- Left: bottom-left key of the left 5-key lower row, matrix `0,0`
- Right: bottom-right key of the right 5-key lower row, matrix `7,5`
- Safety behavior: hold for at least `1500ms`, then release to enter bootloader

Use `mise run build-cosmos` / `mise run flash-cosmos` for default,
and `mise run build-cosmos-raw` / `mise run flash-cosmos-raw` for raw scan.
