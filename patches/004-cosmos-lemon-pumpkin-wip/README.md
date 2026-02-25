# Cosmos Lemon Pumpkin Patch WIP

This patch set adds a new keyboard target and keymaps under:

- `keyboards/cosmos/lemon`
- `keyboards/cosmos/lemon/pumpkin_patch`

Included keymaps:

- `default` (WIP real layout, includes base-layer `QK_BOOT`)
- `matrix_test` (`!row,col` key output)
- `raw_matrix_scan` (`+row,col` and `-row,col` transition output)

Bootloader key (`QK_BOOT`) location: very bottom-right key on the right main block (not the thumb cluster), matrix `7,5`.

Use `mise run build-cosmos` / `mise run flash-cosmos` for default,
and `mise run build-cosmos-raw` / `mise run flash-cosmos-raw` for raw scan.
