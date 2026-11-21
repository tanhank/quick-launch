#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"

echo "==> Uninstalling Quick Launch..."
rm -f "$BIN_DIR/quick-launch"
rm -f "${HOME}/.cache/quick-launch.pid"

if command -v gsettings >/dev/null 2>&1; then
    if gsettings list-schemas | grep -q "org.mate.Marco.global-keybindings"; then
        echo "==> Clearing MATE keybindings..."
        gsettings set org.mate.Marco.global-keybindings run-command-1 "disabled"
        gsettings set org.mate.Marco.keybinding-commands command-1 ""
        gsettings set org.mate.Marco.global-keybindings run-command-2 "disabled"
        gsettings set org.mate.Marco.keybinding-commands command-2 ""
    fi
fi

echo "==> Quick Launch uninstalled successfully."
