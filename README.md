# Bash Utils

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![macOS](https://img.shields.io/badge/Platform-macOS-000000?logo=apple&logoColor=white)
![Homebrew](https://img.shields.io/badge/Homebrew-supported-FBB040?logo=homebrew&logoColor=black)
![MacPorts](https://img.shields.io/badge/MacPorts-supported-1F5FAA)
![Python](https://img.shields.io/badge/Python-http.server-3776AB?logo=python&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-built--in_server-777BB4?logo=php&logoColor=white)
![jq](https://img.shields.io/badge/jq-required-5E97D0)
![peco](https://img.shields.io/badge/peco-required-555555)

Bash Utils is a collection of standalone Bash command-line utilities for macOS-oriented terminal workflows. The repository includes interactive package search tools, local development server wrappers, text formatting helpers, process and task utilities, and small system helpers that can be installed into a user-local bin directory.

## Features

- Browse Homebrew formulae and casks with `bls`, view package metadata, install selections, and open package homepages.
- Browse MacPorts ports with `mpls`, view package metadata, install or uninstall selections, and open package homepages.
- Start local static file servers with `pyserve` and PHP built-in servers with `phpserve`.
- Toggle the macOS microphone input volume with `micm`.
- Open a centered Alacritty command popup with `popup`.
- Navigate a terminal calendar with `calendar`.
- Select running processes and print the selected PID with `psls`.
- Record terminal sessions with `rec`, including an optional asciinema upload.
- Generate QR codes from text with `qr`.
- Manage project TODO files with `todo`, including appending, searching source comments, and collecting TODO comments.
- Generate shell comment blocks with `cmt`, `cmt-section`, and `cmt-title`.
- Trim trailing whitespace from a file or standard input with `ttw`.
- Render centered figlet titles with `title`.
- List shell function completion candidates from `COMP_LINE` with `cmpltn`.

## Tech Stack

### Core

- Bash

### macOS Integrations

- `osascript` for microphone volume control and notifications
- `open` for opening applications, package homepages, and generated files
- `system_profiler` for display resolution detection in `popup`
- Alacritty for terminal popup windows

### Package Managers

- Homebrew via `brew`
- MacPorts via `port`

### CLI Dependencies

- `peco`
- `jq`
- `rg`
- `figlet`
- `asciinema`
- `curl`
- `cal`
- `tput`
- `ps`
- `sed`

### Development Server Runtimes

- Python through `python3` or `python`
- PHP through `php`

## Project Structure

```text
install.sh       Installs every file in src/ into the user bin directory
src/bls          Interactive Homebrew formula and cask browser
src/calendar     Interactive terminal calendar
src/cmt          Toggle comment prefixes for stdin or a file
src/cmt-section  Generate centered section comments
src/cmt-title    Generate boxed title comments
src/cmpltn       Function-name completion helper
src/micm         macOS microphone mute toggle
src/mpls         Interactive MacPorts browser
src/phpserve     PHP built-in server launcher
src/popup        Centered Alacritty command popup launcher
src/psls         Interactive process selector
src/pyserve      Python HTTP server launcher
src/qr           QR code generator using api.qrserver.com
src/rec          asciinema recording wrapper
src/spotlight    peco-based launcher for Brave Browser
src/title        figlet title renderer
src/todo         Project TODO.md manager
src/ttw          Trailing whitespace trimmer
```

## Installation

Clone the repository and run the installer:

```bash
git clone git@github.com:unamatasanatarai/bash-utils.git
cd bash-utils
./install.sh
```

By default, `install.sh` copies every executable file from `src/` into:

```bash
~/.local/bin
```

To install into a different user bin directory, set `XDG_BIN_HOME`:

```bash
XDG_BIN_HOME="$HOME/bin" ./install.sh
```

If the target directory is not in `PATH`, the installer prints the shell export line to add.

## Usage

### Package Browsers

```bash
bls
mpls
```

`bls` requires `brew`, `peco`, and `jq`. `mpls` requires `port` and `peco`.

### Local Development Servers

```bash
pyserve
pyserve 9000

phpserve
phpserve 8080
```

`pyserve` defaults to port `8000`. `phpserve` defaults to port `8181`. Both commands validate that the provided port is between `1` and `65535`.

### Text and Comment Utilities

```bash
ttw path/to/file
printf 'section name\n' | cmt-section
cmt-title "Project Setup"
title "Build Complete"
```

`ttw` reads from a file argument or standard input. `cmt-section` and `cmt-title` accept command arguments or standard input.

### Project TODO Management

```bash
todo "Write release notes"
todo --find
todo --collect
todo --file docs/TODO.md
```

`todo` uses the current Git repository root and defaults to `TODO.md`. It searches for comments matching `# todo:` with `rg`.

### System and Terminal Helpers

```bash
calendar
micm
popup htop
psls
spotlight
```

`calendar` supports `h` and `l` for month navigation, `t` for today, and `q` or Escape to quit. `spotlight` opens Brave Browser from a `peco` selection.

### Recording and QR Codes

```bash
rec "Demo Session"
qr "https://example.com"
```

`rec` records to a timestamped `.cast` file and prompts before uploading to asciinema.org. `qr` downloads a QR code PNG into `/tmp` and opens it with the platform opener when available.

## Configuration

| Variable | Used by | Purpose |
| --- | --- | --- |
| `XDG_BIN_HOME` | `install.sh` | Overrides the installation target directory. |
| `TITLE_FONT` | `title` | Overrides random figlet font selection. |
| `EDITOR` | `todo` | Selects the editor for opening the TODO file. Defaults to `vi`. |
| `ASCIINEMA_API_URL` | `rec` | Set to `https://asciinema.org` before upload. |

The `title` command expects figlet fonts in:

```bash
~/.local/share/figlet
```
