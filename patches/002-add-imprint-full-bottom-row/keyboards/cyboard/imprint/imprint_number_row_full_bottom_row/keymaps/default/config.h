/* Copyright 2023 Cyboard LLC (@Cyboard-DigitalTailor)
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#pragma once

// All other tapping terms are defined relative to this
#define TAPPING_TERM 170
#define TAPPING_TERM_PER_KEY
#define QUICK_TAP_TERM 0
#define QUICK_TAP_TERM_PER_KEY

// If a key is being held before and after another key is tapped, assume it was intentionally a hold
#define PERMISSIVE_HOLD
// Only use PERMISSIVE_HOLD on opposite hands
#define CHORDAL_HOLD
// #define FLOW_TAP_TERM 100

#define UNICODE_SELECTED_MODES UNICODE_MODE_MACOS, UNICODE_MODE_LINUX

// Trackball sensitivity settings
#define CHARYBDIS_MINIMUM_DEFAULT_DPI 400  // Increase base DPI from 400 to 600
#define CHARYBDIS_DEFAULT_DPI_CONFIG_STEP 200  // Each step adds 200 DPI
