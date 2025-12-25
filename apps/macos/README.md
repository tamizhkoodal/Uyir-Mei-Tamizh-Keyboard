## macOS Keyboard (KeyLayout) and Installer

This folder contains a placeholder macOS keyboard layout (`.keylayout`) and a script to build an installer `.pkg`.

What’s included:
- `layout/TamilUyirMei.keylayout`: placeholder layout (ASCII passthrough). Replace with actual Tamil mappings.
- `installer/pkgbuild.sh`: builds a signed/unsigned `.pkg` for system-wide install.
- `installer/scripts/preinstall`, `postinstall`: installer hooks.

Requirements:
- Xcode command line tools
- macOS `pkgbuild` (part of macOS)

Download:
- Latest pkg (default version): [TamizhUyirMei-Keylayout-0.1.0.pkg](./installer/TamizhUyirMei-Keylayout-0.1.0.pkg)

Build:
```
npm run macos:pkg
```

Install:
```
sudo installer -pkg apps/macos/installer/build/UyirMeiTamil-Keylayout-0.1.0.pkg -target /
```

Enable the layout:
1. Log out and back in (or reboot).
2. System Settings → Keyboard → Input Sources → + → search “Uyir-Mei Tamizh (Placeholder)” → Add.

Notes:
- To customize the layout, edit `apps/macos/layout/UyirMeiTamil.keylayout` with proper Tamil key mappings.
- Optionally add `apps/macos/layout/UyirMeiTamil.icns` to show a custom icon in the menu bar.
- For advanced logic beyond static layouts, consider an InputMethodKit-based IME app in a separate target.

## macOS App

This directory will contain the macOS implementation of the Uyir-Mei Tamizh Keyboard.

- Target: macOS (AppKit/Catalyst as applicable)
- Components:
  - App bundle source
  - Input Method implementation
  - Packaging/installer

Structure (proposed):

```
apps/macos/
  src/
  ime/
  installer/
```

For now this is a placeholder; add code and build config as the app evolves.


