#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"

echo "==> Installing Quick Launch..."
mkdir -p "$BIN_DIR"
install -m 755 "$SCRIPT_DIR/bin/quick-launch" "$BIN_DIR/quick-launch"

echo "==> Installed binary to $BIN_DIR/quick-launch"

# Auto-configure MATE shortcuts if running in MATE or gsettings available
if command -v gsettings >/dev/null 2>&1; then
    if gsettings list-schemas | grep -q "org.mate.Marco.global-keybindings"; then
        echo "==> Configuring MATE Marco Super key shortcut..."
        gsettings set org.mate.Marco.keybinding-commands command-1 "$BIN_DIR/quick-launch"
        gsettings set org.mate.Marco.global-keybindings run-command-1 "Super_L"
        gsettings set org.mate.Marco.keybinding-commands command-2 "$BIN_DIR/quick-launch"
        gsettings set org.mate.Marco.global-keybindings run-command-2 "<Super>space"
        echo "==> Bound Super_L and <Super>space to quick-launch!"
    fi
fi

echo "==> Installation complete! Press Super or Super+Space to launch."
