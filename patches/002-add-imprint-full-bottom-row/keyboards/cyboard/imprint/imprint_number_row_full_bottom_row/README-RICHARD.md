# Cyboard Imprint - Colemak-DH with Home Row Mods

This keymap implements Colemak-DH layout with home row mods optimized for typing comfort.

## Build Command

```bash
make cyboard/imprint/imprint_number_row_full_bottom_row:default
```

## Flashing

1. Tap reset button 2x with pen 
2. Drag built firmware to USB storage device

## Home Row Mods

**Left hand (ARST):**
- `A` = Control when held
- `R` = Alt when held  
- `S` = GUI/Win when held
- `T` = Shift when held

**Right hand (NEIO):**
- `N` = Shift when held
- `E` = GUI/Win when held
- `I` = Alt when held
- `O` = Control when held

## Features

- **Chordal Hold**: Prevents accidental mod activation during same-hand rolls
- **Flow Tap**: Disables mods during fast typing (150ms threshold)
- **Optimized timing**: Longer tapping terms for pinky keys (A/O) and ring finger keys (R/I)
- **Permissive Hold**: Better handling of opposite-hand key combinations
