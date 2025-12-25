#!/usr/bin/env bash
set -euo pipefail

# Single entrypoint: build a valid .bundle and a distributable .pkg
# Output:
# - apps/macos/installer/build/TamizhUyirMei.bundle
# - apps/macos/installer/build/TamizhUyirMei-Keylayout-<version>.pkg
#
# Optional flags:
#   --install-bundle-user   Install bundle to ~/Library/Keyboard Layouts
#   --install-bundle-system Install bundle to /Library/Keyboard Layouts (sudo)
#   VERSION=1.0.0           Override version in pkg name
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

LAYOUT_BASENAME="TamizhUyirMei"
SRC_LAYOUT="${REPO_ROOT}/apps/macos/layout/${LAYOUT_BASENAME}.keylayout"
SRC_ICNS="${REPO_ROOT}/apps/macos/layout/${LAYOUT_BASENAME}.icns"

VERSION="${VERSION:-0.1.0}"
# Use a temporary workspace to avoid leaving any build folders behind
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT
BUNDLE_NAME="${LAYOUT_BASENAME}.bundle"
BUNDLE_DIR="${TMP_DIR}/${BUNDLE_NAME}"
RES_DIR="${BUNDLE_DIR}/Contents/Resources"
EN_DIR="${BUNDLE_DIR}/Contents/en.lproj"

PAYLOAD_DIR="${TMP_DIR}/payload"
TARGET_PARENT="${PAYLOAD_DIR}/Library/Keyboard Layouts"
TARGET_BUNDLE_DIR="${TARGET_PARENT}/${BUNDLE_NAME}"
# Place final installer pkg under the installer folder (not in build/)
PKG_PATH="${REPO_ROOT}/apps/macos/installer/${LAYOUT_BASENAME}-Keylayout-${VERSION}.pkg"

echo "Preparing build directories..."
mkdir -p "${RES_DIR}" "${EN_DIR}" "${TARGET_PARENT}"

if [[ ! -f "${SRC_LAYOUT}" ]]; then
  echo "ERROR: Missing layout: ${SRC_LAYOUT}"
  exit 1
fi
if [[ ! -f "${SRC_ICNS}" ]]; then
  echo "WARNING: Icon not found: ${SRC_ICNS}"
  echo "         Proceeding without icon."
fi

echo "Writing Info.plist..."
cat > "${BUNDLE_DIR}/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleIdentifier</key>
	<string>org.tamizhkoodal.keyboardlayout.tamizhuyirmei</string>
	<key>CFBundleName</key>
	<string>TamizhUyirMei</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>KLInfo_Tamizh Uyir Mei</key>
	<dict>
		<key>TICapsLockLanguageSwitchCapable</key>
		<false/>
		<key>TISIconIsTemplate</key>
		<false/>
		<key>TISInputSourceID</key>
		<string>org.tamizhkoodal.keyboardlayout.tamizhuyirmei.tamizhuyirmei</string>
		<key>TISIntendedLanguage</key>
		<string>ta</string>
	</dict>
</dict>
</plist>
PLIST

echo 'CFBundleName = "Tamizh Uyir Mei";' > "${EN_DIR}/InfoPlist.strings"

echo "Copying resources into bundle..."
cp "${SRC_LAYOUT}" "${RES_DIR}/${LAYOUT_BASENAME}.keylayout"
if [[ -f "${SRC_ICNS}" ]]; then
  cp "${SRC_ICNS}" "${RES_DIR}/${LAYOUT_BASENAME}.icns"
fi

echo "Creating payload with bundle..."
cp -R "${BUNDLE_DIR}" "${TARGET_BUNDLE_DIR}"

echo "Building pkg..."
pkgbuild \
  --root "${PAYLOAD_DIR}" \
  --identifier "org.tamizhkoodal.${LAYOUT_BASENAME}.keylayout" \
  --version "${VERSION}" \
  --install-location "/" \
  --ownership recommended \
  "${PKG_PATH}"

echo "Pkg:    ${PKG_PATH}"

if [[ "${1:-}" == "--install-bundle-user" ]]; then
  DEST="${HOME}/Library/Keyboard Layouts/${BUNDLE_NAME}"
  echo "Installing bundle to user Library: ${DEST}"
  rm -rf "${DEST}"
  mkdir -p "$(dirname "${DEST}")"
  cp -R "${BUNDLE_DIR}" "${DEST}"
  echo "Installed. Log out/in then add input source in System Settings."
elif [[ "${1:-}" == "--install-bundle-system" ]]; then
  DEST="/Library/Keyboard Layouts/${BUNDLE_NAME}"
  echo "Installing bundle to system Library: ${DEST}"
  sudo rm -rf "${DEST}"
  sudo cp -R "${BUNDLE_DIR}" "${DEST}"
  echo "Installed. Log out/in then add input source in System Settings."
fi





