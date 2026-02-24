# Catppuccin Tmux

A soothing pastel theme for Tmux, based on the [Catppuccin](https://github.com/catppuccin/catppuccin) color palette.

## Flavors

| Flavor | Description |
|---|---|
| Mocha | Dark, warm tones (default) |
| Macchiato | Dark, muted tones |
| Frappe | Medium dark, cool tones |
| Latte | Light theme |

## Requirements

This theme has the following hard requirements:

- Any patched [Nerd Fonts] (v3 or higher)
- Bash 4.2 or newer

The following are recommended for full support of all widgets and features:

- [Noto Sans] Symbols 2 (for segmented digit numbers)
- [bc] (for netspeed and git widgets)
- [jq], [gh], [glab] (for git widgets)
- [playerctl] (Linux) or [nowplaying-cli] (macOS) for music statusbar

### macOS

macOS still ships with bash 3.2 so you must provide a newer version.
You can easily install all dependencies via [Homebrew]:

```bash
brew install --cask font-monaspace-nerd-font font-noto-sans-symbols-2
brew install bash bc coreutils gawk gh glab gsed jq nowplaying-cli
```

### Linux

#### Alpine Linux

```bash
apk add bash bc coreutils gawk git jq playerctl sed
```

#### Arch Linux

```bash
pacman -Sy bash bc coreutils git jq playerctl
```

#### Ubuntu

```bash
apt-get install bash bc coreutils gawk git jq playerctl
```

## Installation using TPM

In your `tmux.conf`:

```bash
set -g @plugin "flaviotux/catppuccin-tmux"
```

## Configuration

### Flavors

```bash
set -g @catppuccin_flavor mocha       # mocha | macchiato | frappe | latte
set -g @catppuccin_transparent 1      # 1 or 0
```

### Number styles

```bash
set -g @catppuccin_window_id_style digital
set -g @catppuccin_pane_id_style hsquare
set -g @catppuccin_zoom_id_style dsquare
```

### Window styles

```bash
# Icon styles
set -g @catppuccin_terminal_icon
set -g @catppuccin_active_terminal_icon

# No extra spaces between icons
set -g @catppuccin_window_tidy_icons 0
```

### Widgets

#### Date and Time widget

This widget is enabled by default. To disable it:

```bash
set -g @catppuccin_show_datetime 0
set -g @catppuccin_date_format MYD
set -g @catppuccin_time_format 12H
```

##### Available Options

- `YMD`: (Year Month Day), 2024-01-31
- `MDY`: (Month Day Year), 01-31-2024
- `DMY`: (Day Month Year), 31-01-2024

- `24H`: 18:30
- `12H`: 6:30 PM

#### Now Playing widget

```bash
set -g @catppuccin_show_music 1
```

#### Netspeed widget

```bash
set -g @catppuccin_show_netspeed 1
set -g @catppuccin_netspeed_iface "wlan0" # Detected via default route
set -g @catppuccin_netspeed_showip 1      # Display IPv4 address (default 0)
set -g @catppuccin_netspeed_refresh 1     # Update interval in seconds (default 1)
```

#### Path Widget

```bash
set -g @catppuccin_show_path 1
set -g @catppuccin_path_format relative # 'relative' or 'full'
```

#### Battery Widget

```bash
set -g @catppuccin_show_battery_widget 1
set -g @catppuccin_battery_name "BAT1"  # some linux distro have 'BAT0'
set -g @catppuccin_battery_low_threshold 21 # default
```

Set variable value `0` to disable the widget. Remember to restart `tmux` after
changing values.

#### Web-based Git Widget

This widget shows GitHub/GitLab statistics including PR counts and issues assigned to you. It requires `gh` (GitHub CLI) or `glab` (GitLab CLI) to be installed and authenticated.

```bash
set -g @catppuccin_show_wbg 1
```

The widget works with both SSH and HTTPS git remote URLs:
- SSH: `git@github.com:user/repo.git`
- HTTPS: `https://github.com/user/repo.git`

Set variable value `0` to disable the widget. Remember to restart `tmux` after changing values.

#### Hostname Widget

```bash
set -g @catppuccin_show_hostname 1
```

## Styles

- `hide`: hide number
- `none`: no style, default font
- `digital`: 7 segment number (needs Unicode support)
- `roman`: roman numbers (needs nerdfont)
- `fsquare`: filled square (needs nerdfont)
- `hsquare`: hollow square (needs nerdfont)
- `dsquare`: hollow double square (needs nerdfont)
- `super`: superscript symbol
- `sub`: subscript symbols

## Features

- Local git stats
- Web based git server (GitHub/GitLab) stats
  - Open PR count
  - Open PR reviews count
  - Issue count
- Remote branch sync indicator
- Prefix highlight incorporated
- Now Playing status bar, supporting [playerctl]/[nowplaying-cli]
- Custom pane number indicator
- Pane zoom mode indicator
- Date and time
- Battery status
- Network speed
- Path display
- Hostname display

## Acknowledgments

This project was heavily inspired by and forked from [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux) by [@janoamaral](https://github.com/janoamaral). The widget system, layout structure, and overall architecture originate from that project. Thank you for the excellent work!

## License

[MIT](LICENSE.md)

[Noto Sans]: https://fonts.google.com/noto/specimen/Noto+Sans
[Nerd Fonts]: https://www.nerdfonts.com/
[bc]: https://www.gnu.org/software/bc/
[jq]: https://jqlang.github.io/jq/
[gh]: https://cli.github.com/
[glab]: https://gitlab.com/gitlab-org/cli
[playerctl]: https://github.com/altdesktop/playerctl
[nowplaying-cli]: https://github.com/kirtan-shah/nowplaying-cli
[Homebrew]: https://brew.sh/
