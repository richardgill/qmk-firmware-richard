# Cosmos Lemon Custom Variants WIP

This patch set adds new keyboard targets and keymaps under:

- `keyboards/cosmos/lemon`
- `keyboards/cosmos/lemon/custom_1`
- `keyboards/cosmos/lemon/custom_2`

Included keymaps:

- `default` (WIP real layout, includes base-layer `SAFE_BOOT` on both sides)
- `raw_matrix_scan` (`+row,col` and `-row,col` transition output)

Bootloader entry from keymap (`SAFE_BOOT`):

- Left: bottom-left key of the left 5-key lower row, matrix `0,0`
- Right: bottom-right key of the right 5-key lower row, matrix `7,5`
- Safety behavior: hold for at least `1500ms`, then release to enter bootloader

Use `mise run build-cosmos-1` / `mise run flash-cosmos-1` for custom_1 default,
`mise run build-cosmos-2` / `mise run flash-cosmos-2` for custom_2 default,
`mise run build-cosmos-raw-1` / `mise run flash-cosmos-raw-1` for custom_1 raw scan,
and `mise run build-cosmos-raw-2` / `mise run flash-cosmos-raw-2` for custom_2 raw scan.
