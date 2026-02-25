#include QMK_KEYBOARD_H
#include <stdio.h>

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_num_full_bottom_row(
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO
    ),
};

void matrix_scan_user(void) {
    static matrix_row_t previous[MATRIX_ROWS] = {0};

    for (uint8_t row = 0; row < MATRIX_ROWS; row++) {
        const matrix_row_t current = matrix_get_row(row);
        const matrix_row_t changed = current ^ previous[row];

        if (changed == 0) {
            continue;
        }

        for (uint8_t col = 0; col < MATRIX_COLS; col++) {
            const matrix_row_t mask = (matrix_row_t)1 << col;
            if ((changed & mask) == 0) {
                continue;
            }

            char buffer[20];
            const char state = (current & mask) != 0 ? '+' : '-';
            snprintf(buffer, sizeof(buffer), "%c%u,%u ", state, row, col);
            SEND_STRING(buffer);
        }

        previous[row] = current;
    }
}
