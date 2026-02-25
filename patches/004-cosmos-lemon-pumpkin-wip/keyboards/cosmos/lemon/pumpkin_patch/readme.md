# Cosmos Lemon Pumpkin Patch

## Keymaps

- `default`
- `matrix_test`
- `raw_matrix_scan`

## Safe boot keys (`default`)

`default` uses a custom `SAFE_BOOT` keycode (instead of plain `QK_BOOT`) to reduce accidental bootloader entry.

- Left safe boot key: matrix `0,0`
- Right safe boot key: matrix `7,5`
- Trigger: hold for `1500ms` and release

## Build / flash

```bash
qmk compile -kb cosmos/lemon/pumpkin_patch -km default
qmk flash -kb cosmos/lemon/pumpkin_patch -km default -bl uf2-split-left
qmk flash -kb cosmos/lemon/pumpkin_patch -km default -bl uf2-split-right
```
