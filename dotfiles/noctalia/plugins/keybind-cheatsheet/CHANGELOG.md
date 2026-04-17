# Changelog

## [3.4.0] - 2026-04-07

### Bug Fixes

**Settings unreachable from panel button**
- Fixed critical bug where clicking the settings button (top-right of the keybind panel) blocked all input in the settings window
- The panel now closes before opening settings, preventing the open panel from intercepting mouse events
- Reported by Discord users: editing width/height was impossible when settings were opened this way

**Settings not saved when opened from panel**
- Fixed settings changes being silently discarded when the settings window was opened via the panel button
- `saveSettings()` was declared on an inner `ColumnLayout` instead of the root `Item`, making it invisible to the Noctalia shell
- With the previous direct-mutation approach this went unnoticed; after switching to the edit-copy pattern saves now work correctly from all entry points

### Code Quality

**Settings: edit-copy pattern**
- Replaced direct `pluginSettings` mutation in `onTextChanged` handlers with proper edit-copy properties (`editWindowWidth`, `editWindowHeight`, `editAutoHeight`, `editColumnCount`, `editModKeyVariable`, `editHyprlandConfigPath`, `editNiriConfigPath`)
- Changes are committed to `pluginSettings` only when the user clicks Save, matching Noctalia plugin conventions

**i18n: corrected structure**
- Removed `"keybind-cheatsheet"` top-level wrapper from all 20 language JSON files
- Removed `"keybind-cheatsheet."` prefix from all 50 `tr()` calls across all QML files
- Structure now matches the Noctalia plugin i18n specification

**Removed dead code**
- Deleted unused `parseNiriConfig()` function (118 lines) superseded by `parseNiriFileContent()` in v3.1.0

**Shell injection hardening**
- Glob expansion in config path resolution now passes user-provided patterns as positional shell arguments (`$1`) instead of string-concatenating them into the shell command, preventing potential injection via crafted config path values

**resizeTimer: semantic popup detection**
- Replaced fragile `toString()` string matching (`"Popup_QMLTYPE"`, `"NPluginSettingsPopup"`) with a semantic check (`typeof obj.modal === "boolean"`) that works with any QML `Popup` subclass

**Named key badge colors**
- Extracted hardcoded hex colors in `getKeyColor()` into named `readonly property color` constants (`keyColorAlt`, `keyColorXF86`, `keyColorPrint`, `keyColorNumeric`, `keyColorMouse`)

### Manifest

- Added missing `repository` field
- Added tags: `System`, `Indicator` (alongside existing `Bar`, `Panel`)

---

## [3.2.2] - 2026-02-08

### Bug Fixes

**Hyprland Parser - No Category Handling**
- Fixed parser crash when Hyprland config has no category headers (`# 1. Category Name`)
- Parser now creates default "Keybinds" category for configs without categories
- Default category name is fully translatable via i18n system
- Prevents keybind loss for users who don't organize their configs with categories

### Translations

**Complete i18n Coverage**
- Added `default-category` translations for all 19 supported languages
- Added missing `error` section translations to all language files (includes German from 3.1.2)
- All language files now have identical structure (61-62 lines each)
- Improved translation consistency across all locales

**Supported Languages:**
- English (en), Polish (pl), German (de), French (fr), Spanish (es)
- Italian (it), Portuguese (pt), Dutch (nl), Russian (ru), Japanese (ja)
- Chinese Simplified (zh-CN), Chinese Traditional (zh-TW), Korean (ko-KR)
- Turkish (tr), Ukrainian (uk-UA), Swedish (sv), Hungarian (hu)
- Kurdish (ku), Norwegian Nynorsk (nn-NO), Hindi/Nepali (hn)

### Code Quality

**Memory Leak Prevention**
- Added recursion limit tracking for parser (`hasCategories` flag)
- Improved parser robustness and error handling
- Better fallback behavior for edge cases

---

## [3.1.2] - 2026-02-08

### Translations

- Added german translations for the `error` keys

## [3.1.1] - 2026-02-03

### Smart Caching

**Compositor Change Detection**
- Plugin now detects when compositor changes (e.g., switching from Hyprland to Niri)
- Automatically re-parses config only when compositor differs from cached data
- Instant panel opening when using same compositor (uses cache)
- Saves detected compositor in settings for comparison

### Bug Fixes

**Improved Niri Parser**
- Fixed multiline bind parsing - handles binds that span multiple lines
- Added `spawn-sh` action support for shell command spawning
- Added `move-column-to-workspace` and `move-window-to-workspace` action categories
- Better handling of complex Niri config structures

**Better Error Messages**
- User-friendly messages for unsupported compositors (Sway, LabWC, MangoWC)
- Each compositor shows specific explanation why it's not supported
- All error messages are translatable via i18n

### Documentation

**README Updates**
- Fixed IPC command syntax in examples
- Updated keybind format examples to use `$mainMod` instead of `$mod`
- Clarified configuration file paths and formats

---

## [3.1.0] - 2026-02-03

### New Features

**Niri Support**
- Full Niri compositor support with KDL config parsing
- Recursive file parsing with `source` directive support
- Automatic action categorization
- Multiline bind support

**Recursive Config Parsing**
- Both Hyprland and Niri now support recursive file includes
- Memory leak prevention with recursion limits
- Glob pattern support for bulk file imports

### Improvements

**Better Error Handling**
- Graceful fallback for unsupported compositors
- User-friendly error messages
- Translation support for all error states

---

## [3.0.0] - 2026-01-30

### Initial Release

**Core Features**
- Hyprland keybind parsing
- Category organization
- Multi-language support
- Bar widget integration
- Settings UI
