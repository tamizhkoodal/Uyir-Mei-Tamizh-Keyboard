# Uyir-Mei-Tamizh-Keyboard
Native Tamizh keyboard. First-class macOS support; Windows/Android/iOS planned.

## Download (macOS)
- Installer: [TamizhUyirMei-Keylayout-0.1.0.pkg](apps/macos/installer/TamizhUyirMei-Keylayout-0.1.0.pkg)

## Quick install (macOS)
- Run the pkg.
- Log out/in (or reboot).
- System Settings → Keyboard → Input Sources → + → search “Tamizh Uyir Mei” → Add.

## Highlights
- Tamil typing that feels native
  - Public Tamil99 reference mapping
  - Uyir+Mei composition (actions) for correct syllable formation
- macOS shortcuts work as expected
  - Command (⌘) uses ASCII for app shortcuts
  - Control (⌃) emits control codes
- Clean packaging
  - Single `.pkg` output; no build folders left behind

## Build from source (macOS)
Prereqs: Xcode Command Line Tools, `pkgbuild`

```
npm run macos:pkg            # creates apps/macos/installer/TamizhUyirMei-Keylayout-0.1.0.pkg
npm run macos:pkg:install    # installs the latest pkg
```

## Troubleshooting
- Layout not showing after install: log out/in (or reboot), then add the input source.
- Already added but not switching: enable “Show Input menu in menu bar” in Keyboard settings.

## Project structure
- `apps/macos/layout/` — `TamizhUyirMei.keylayout`, optional `TamizhUyirMei.icns`
- `apps/macos/scripts/` — `build_layout.sh` (builds `.pkg`)
- `apps/macos/installer/` — output `.pkg`

## Roadmap
- Windows IME
- Android/iOS keyboards
- Preferences UI and layout variants
