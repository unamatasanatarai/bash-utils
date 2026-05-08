# Bash Utils

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-macOS-000000?logo=apple&logoColor=white)

A collection of high-performance, Pure Bash utility scripts designed to enhance the macOS terminal experience. These tools focus on flat execution flows and minimal process forks to provide a fast, responsive interface for package management, process selection, and development workflows.

## Features

- **Interactive Package Management**: Browse, search, and install Homebrew formulae and casks via `bls`.
- **System Utilities**: Interactive TUI calendar, process selector, and macOS-specific microphone mute toggle.
- **Development Enhancements**: PHP built-in server wrapper, trailing whitespace trimmer, and terminal session recording via `asciinema`.
- **UI & Layout**: Centered Alacritty terminal popup launcher with automatic screen resolution detection.
- **Comment & Documentation**: Stylized section and title comment generators for cleaner code documentation.
- **Task Management**: Project-level TODO management that can collect tasks from source code into a central `TODO.md`.

## Tech Stack

- **Core**: Bash (Optimized for Pure Bash performance)
- **Fuzzy Selectors**: `peco`, `fzf`
- **Data Processing**: `jq`, `sed`
- **Terminal & UI**: `alacritty`, `tput`, `figlet`
- **Integrations**: `brew`, `asciinema`, `osascript` (AppleScript), `php`

## Project Structure

- `bls`: Brew List & Search interactive utility.
- `calendar`: TUI-based interactive calendar with month navigation.
- `popup`: Centered Alacritty window launcher with auto-resizing logic.
- `todo`: Task manager for project-specific `TODO.md` files.
- `psls`: Interactive process selector and PID viewer.
- `spotlight`: Fuzzy-search based application and custom script launcher.
- `micm`: macOS microphone mute toggle with system notifications.
- `ttw`: Pure Bash trailing whitespace trimmer.
- `spotlight_commands/`: Directory containing modular actions for the `spotlight` utility.

## Installation

1.  Clone the repository to your local machine:
    ```bash
    git clone https://github.com/your-username/bash-utils.git
    ```
2.  Add the script directory to your system `PATH`:
    ```bash
    export PATH="$PATH:/path/to/bash-utils"
    ```
3.  Ensure the required dependencies are installed via Homebrew:
    ```bash
    brew install peco jq figlet asciinema
    ```

## Usage

Most scripts can be run directly from the terminal without additional configuration.

### Interactive Brew Search
```bash
bls
```

### Terminal Popup
Launch any command in a centered Alacritty popup:
```bash
popup htop
```

### PHP Development Server
Start a server on a custom port (default: 8181):
```bash
phpserve 8080
```

### Recording Terminal Sessions
```bash
rec "My Session Title"
```

## Configuration

Some scripts support environment variables for customization:
- `TITLE_FONT`: Override the default font used by the `title` script.
- `EDITOR`: The text editor used by the `todo` script (defaults to `vi`).