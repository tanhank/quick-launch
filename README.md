# Quick Launch

A lightweight, keyboard-driven application launcher popup for Linux desktops (MATE, XFCE, and other X11 environments).

![Preview](assets/preview.png)

## Features

- **Fast Application Discovery**: Queries installed `.desktop` files using `Gio.AppInfo` in under 20ms.
- **Real-Time Fuzzy Matching**: Searches names, generic categories, executables, and desktop keywords.
- **Keyboard Driven**: Immediate input focus, auto-selects top match, arrow key navigation, Enter to launch, and Esc to dismiss.
- **Single-Instance Toggle**: Repeatedly pressing the hotkey toggles the window open and closed.
- **Zero Background Daemons**: Runs on-demand without background RAM overhead.

## Installation

```bash
git clone https://github.com/tanhank/quick-launch.git
cd quick-launch
./install.sh
```

The installer places the executable in `~/.local/bin/quick-launch` and configures the `Super_L` and `<Super>space` shortcuts on MATE.

## Manual Keybinding Configuration

If you use another window manager (i3, Openbox, XFCE):

- **Command**: `quick-launch`
- **Recommended Shortcut**: `Super` or `Super+Space`

## Removal

```bash
./uninstall.sh
```
