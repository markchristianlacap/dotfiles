# 🏠 .dotfiles  

My personal dotfiles — minimal, fast, and designed for flexibility across systems.  
The color palette is based on the [Kanagawa Dragon](https://github.com/rebelot/kanagawa.nvim) theme.  
You're welcome to explore or reuse parts of it, but note that some settings are highly customized.

---

## 💻 System Compatibility
- **Primary:** Arch Linux with X11 and suckless tools
- **Secondary:** macOS support (via Hammerspoon for window management)
- Managed with **GNU Stow** for symlink management

---

## 🧱 Window Manager Setup

### Linux (X11)
- [**dwm**](https://github.com/markchristianlacap/dwm) – dynamic window manager (commented out)
- [**st**](https://github.com/markchristianlacap/st) – simple terminal  
- [**dmenu**](https://github.com/markchristianlacap/dmenu) – dynamic menu  
- [**dwmblocks-async**](https://github.com/markchristianlacap/dwmblocks-async) – modular status bar (commented out)

### macOS
- **Hammerspoon** – automation and window management via Lua scripting

---

## ⚙️ Core Configurations

### Window Manager & Display
- **picom** – compositor for transparency and shadows  
- **dunst** – lightweight notification daemon  
- **sxhkd** – hotkey daemon for custom keybindings  
- **feh** – wallpaper setter  
- **flameshot** – powerful screenshot tool  

### Shell & Terminal
- **zsh** – shell with custom prompt and aliases  
  - **zsh-syntax-highlighting** – syntax highlighting plugin  
  - **zsh-autosuggestions** – fish-like autosuggestions  
  - **zsh-vi-mode** – vi mode for zsh  
- **kitty** – fast, feature-rich terminal emulator
- **tmux** – terminal multiplexer with custom configuration  
- **zoxide** – smarter `cd` command (configured in `.zshrc`)

### File Management & Navigation
- **yazi** – modern terminal file manager (with custom function in `.zshrc`)
- **fzf** – fuzzy finder for quick navigation  
- **eza** – modern `ls` replacement with colors and icons  

### Editor & Development
- **Neovim** – extensively configured with:
  - LSP (Language Server Protocol) support
  - Auto-completion and formatting
  - Custom keybindings and plugins via lazy.nvim
  - Configuration at `.config/nvim/`
  - Custom spell checking with `cspell.json`
  - Stylua formatting with `.stylua.toml`

### Audio & Media (Linux)
- **pipewire** – modern audio server with custom input filter chain  
- **amixer** – ALSA mixer for volume control  
- **pavucontrol** – PulseAudio volume control GUI  

---

## 📂 Directory Structure

```
.
├── .config/
│   ├── dunst/          # Notification daemon config
│   ├── kitty/          # Terminal emulator config
│   ├── nvim/           # Neovim configuration
│   ├── picom/          # Compositor config
│   ├── pipewire/       # Audio server config
│   ├── sxhkd/          # Hotkey daemon config
│   └── tmux/           # Terminal multiplexer config
├── .hammerspoon/       # macOS window management (Lua)
├── .scripts/           # Custom shell scripts
│   ├── battery.sh
│   ├── battery_notify.sh
│   ├── bluetooth_status
│   ├── extend.sh
│   ├── powermenu.sh
│   ├── tmux-session.sh
│   └── vbox.sh
├── .xinitrc            # X session initialization (Linux)
├── .Xresources         # X11 terminal colors (Kanagawa Dragon)
├── .zprofile           # Auto-start X on tty1 (Linux)
├── .zshrc              # Zsh configuration
└── .stow-local-ignore  # Stow ignore patterns
```

---

## 📜 Key Configuration Files

### `.xinitrc`
Initializes the X session with:
- Display setup via `xrandr` (dual monitor configuration)
- Starts dunst, picom, sxhkd, flameshot, and wallpaper
- Loads `.Xresources` for terminal theming
- Executes `oxwm` window manager

### `.zshrc`
Comprehensive shell configuration featuring:
- Environment variables (PATH, EDITOR, TERM)
- Extended history with 100,000 entries
- Custom Git-aware prompt
- Yazi integration with directory return
- Zoxide, syntax highlighting, autosuggestions
- Aliases and custom functions

### `.Xresources`
Terminal color scheme based on Kanagawa Dragon theme:
- 16-color palette (8 normal + 8 bright colors)
- Font: Iosevka SS04, size 15
- Foreground: `#c5c9c5`, Background: `#181616`

### `.stow-local-ignore`
Excludes from stow symlinking:
- Version control files (`.git`, `.gitignore`)
- README, LICENSE, COPYING
- `.xinitrc` and `.Xresources` (manually managed)
- Images (`.png`, `.jpg`)
- Scripts (`.sh`)
- Tmux plugins

---

## 🚀 Installation

### Using GNU Stow
```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Stow packages (creates symlinks)
stow .
```

### Manual Setup (Linux)
```bash
# Link configuration files
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/.Xresources ~/.Xresources

# Link config directories
ln -sf ~/.dotfiles/.config/* ~/.config/

# Make scripts executable
chmod +x ~/.dotfiles/.scripts/*
```

---

## ✨ Fonts
- **Iosevka SS04** – programming font  
- **Symbols Nerd Font** – icon glyphs for status bars and terminals

Install on Arch Linux:
```bash
yay -S ttf-iosevka ttf-nerd-fonts-symbols
```

---

## 📸 Preview
![Desktop Preview](./preview.png)

---

## 📝 Notes
- Some settings are hardware-specific (e.g., xrandr display configuration)
- Commented lines in `.xinitrc` show alternative configurations (dwm, dwmblocks, nvidia-settings)
- The setup supports both minimal (suckless) and full-featured (kitty, nvim) workflows
- macOS support is provided via Hammerspoon configuration

