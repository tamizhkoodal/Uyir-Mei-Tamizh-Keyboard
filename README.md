# Uyir+Mei Tamizh Keyboard உயிர்+மெய் தமிழ் தட்டச்சு
Native Tamizh keyboard. First-class macOS support; Windows/Android/iOS planned.

## macOS

##### [Caps]
<img width="400" height="393" alt="Screenshot 2025-12-25 at 2 31 00 PM" src="https://github.com/user-attachments/assets/879eb085-b766-4ab0-b58b-d6c27265c6ac" />

##### [Caps + Shift]
<img width="400" height="395" alt="Screenshot 2025-12-25 at 2 31 19 PM" src="https://github.com/user-attachments/assets/2df9f37f-4d4a-4523-bfb9-86f54bf6251c" />

##### Normal
<img width="400" height="363" alt="Screenshot 2025-12-25 at 2 34 32 PM" src="https://github.com/user-attachments/assets/a7036b0e-5c2f-4738-842f-e98fb877400c" />

##### [Option]
<img width="400" height="405" alt="Screenshot 2025-12-25 at 2 59 01 PM" src="https://github.com/user-attachments/assets/d84c047b-4446-4a18-945e-c2b0799b19a6" />

##### [Option + Shift]
<img width="400" height="396" alt="Screenshot 2025-12-25 at 2 52 22 PM" src="https://github.com/user-attachments/assets/f20bafd6-b802-4dd0-8b0b-7ad41bfe349e" />

## Key placement (உயிர்+மெய்)
Keyboard letter placement based on tamizh grammer Uyir+Mei for easy remember

தட்டச்சு பொத்தான்களை சுலபமாக நினைவில் வைத்துக்கொள்ள

- **குறில் (short vowels)**: அ, இ, உ, எ, ஒ, ஐ, ஔ
- **நெடில் (long vowels)** (Shift): ஆ, ஈ, ஊ, ஏ, ஓ
- **புள்ளி**: ◌்

- **வல்லினம்**: க, ச, ட, த, ப, ற
- **இடையினம்**: ய, ர, ல, வ, ழ, ள
- **மெல்லினம்**: ங, ஞ, ண, ந, ம, ன

- **கிரந்த எழுத்துக்கள்** (option + Shift): ஸ, ஷ, ஜ, ஹ, க்ஷ


Examples:
   க் + இ → கி
   க +  ி → கி,
   க் + ஆ → கா,
   த் + உ → து
   ப் + ஏ → பே

## Download (macOS)
- Installer: [TamizhUyirMei-Keylayout-0.1.0.pkg](apps/macos/installer/TamizhUyirMei-Keylayout-0.1.0.pkg?raw=1)

### பதிவிறக்கம் (macOS)
- நிறுவி: [TamizhUyirMei-Keylayout-0.1.0.pkg](apps/macos/installer/TamizhUyirMei-Keylayout-0.1.0.pkg?raw=1)

## Quick install (macOS)
- Run the pkg.
- Log out/in (or reboot).
- System Settings → Keyboard → Input Sources → + → search “Tamizh Uyir Mei” → Add.

### விரைவு நிறுவல் (macOS)
- pkg கோப்பை இயக்கவும்.
- வெளியேறி மீண்டும் உள்நுழையவும் (அல்லது மறுதொடக்கம்).
- System Settings → Keyboard → Input Sources → + → “Tamizh Uyir Mei” எனத் தேடி சேர்க்கவும்.

## Highlights
- Tamil typing that feels native
  - Public Tamil99 reference mapping
  - Uyir+Mei composition (actions) for correct syllable formation
- macOS shortcuts work as expected
  - Command (⌘) uses ASCII for app shortcuts
  - Control (⌃) emits control codes
- Clean packaging
  - Single `.pkg` output; no build folders left behind

### முக்கிய அம்சங்கள்
- இயல்பான தமிழ் தட்டச்சு அனுபவம்
  - பொது Tamil99 குறிப்பு அமைப்பு
  - உயிர்+மெய் சேர்க்கை (actions) மூலம் சரியான எழுத்துச்சேர்க்கை
- macOS குறுக்கு விசைகள் வழக்கம் போல்
  - Command (⌘) பயன்பாட்டுக் குறுக்குவழிகளுக்கு ASCII
  - Control (⌃) கட்டுப்பாட்டு குறியீடுகள்
- சுத்தமான தொகுப்பு
  - ஒரே `.pkg` வெளியீடு; கூடுதல் build கோப்புகள் இல்லை


## Build from source (macOS)
Prereqs: Xcode Command Line Tools, `pkgbuild`

```
npm run macos:pkg            # creates apps/macos/installer/TamizhUyirMei-Keylayout-0.1.0.pkg
npm run macos:pkg:install    # installs the latest pkg
```

### மூலமாக கட்டமைப்பு (macOS)
தேவைகள்: Xcode Command Line Tools, `pkgbuild`
```
npm run macos:pkg            # apps/macos/installer/ இல் pkg உருவாகும்
npm run macos:pkg:install    # சமீபத்திய pkg நிறுவும்
```

## Troubleshooting
- Layout not showing after install: log out/in (or reboot), then add the input source.
- Already added but not switching: enable “Show Input menu in menu bar” in Keyboard settings.

### சிக்கல்கள் / தீர்வுகள்
- நிறுவிய பின் அமைப்பு தெரியவில்லை: வெளியேறி/மறுதொடக்கம் செய்து மீண்டும் Input Source சேர்க்கவும்.
- மெனு மாறவில்லை: Keyboard settings இல் “Show Input menu in menu bar” ஐ இயக்கவும்.

## Project structure
- `apps/macos/layout/` — `TamizhUyirMei.keylayout`, optional `TamizhUyirMei.icns`
- `apps/macos/scripts/` — `build_layout.sh` (builds `.pkg`)
- `apps/macos/installer/` — output `.pkg`

### திட்ட அமைப்பு
- `apps/macos/layout/` — keylayout மற்றும் (விருப்ப) icon
- `apps/macos/scripts/` — `.pkg` உருவாக்கும் script
- `apps/macos/installer/` — உருவான `.pkg`

## Roadmap
- Windows IME
- Android/iOS keyboards
- Preferences UI and layout variants

### திட்ட வரைபடம்
- Windows IME
- Android/iOS விசைப்பலகை
- Preferences UI மற்றும் layout மாறுபாடுகள்
