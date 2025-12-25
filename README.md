# Uyir+Mei Tamizh Keyboard உயிர்+மெய் தமிழ் பெத்தான்பலகை 
Native Tamizh keyboard. First-class macOS support; Windows/Android/iOS planned.

## macOS
<img width="400" height="393" alt="Screenshot 2025-12-25 at 2 31 00 PM" src="https://github.com/user-attachments/assets/879eb085-b766-4ab0-b58b-d6c27265c6ac" />
<img width="400" height="395" alt="Screenshot 2025-12-25 at 2 31 19 PM" src="https://github.com/user-attachments/assets/2df9f37f-4d4a-4523-bfb9-86f54bf6251c" />
<img width="400" height="363" alt="Screenshot 2025-12-25 at 2 34 32 PM" src="https://github.com/user-attachments/assets/a7036b0e-5c2f-4738-842f-e98fb877400c" />
<img width="400" height="405" alt="Screenshot 2025-12-25 at 2 59 01 PM" src="https://github.com/user-attachments/assets/d84c047b-4446-4a18-945e-c2b0799b19a6" />
<img width="400" height="396" alt="Screenshot 2025-12-25 at 2 52 22 PM" src="https://github.com/user-attachments/assets/f20bafd6-b802-4dd0-8b0b-7ad41bfe349e" />


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
