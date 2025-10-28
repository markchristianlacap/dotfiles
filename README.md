# 🏠 .dotfiles  

My personal **suckless setup** — minimal, fast, and built for Arch Linux.  
The color palette is based on the [Kanagawa Dragon](https://github.com/rebelot/kanagawa.nvim) theme.  
You're welcome to explore or reuse parts of it, but note that some settings are highly customized.

---

### 💻 Operating System
- **Arch Linux**

---

### 🧱 Suckless Components
- [**dwm**](https://github.com/markchristianlacap/dwm) – dynamic window manager  
- [**st**](https://github.com/markchristianlacap/st) – simple terminal  
- [**dmenu**](https://github.com/markchristianlacap/dmenu) – dynamic menu  
- [**dwmblocks-async**](https://github.com/markchristianlacap/dwmblocks-async) – modular status bar  

---

### ⚙️ Core Configurations

#### Window Manager & Display
- **picom** – compositor for transparency and shadows  
- **dunst** – lightweight notification daemon  
- **sxhkd** – hotkey daemon for custom keybindings  
- **feh** – wallpaper setter  
- **slock** – simple X screen locker  
- **flameshot** – powerful screenshot tool  

#### Shell & Terminal
- **zsh** – shell with custom prompt and aliases  
  - **zsh-syntax-highlighting** – syntax highlighting plugin  
  - **zsh-autosuggestions** – fish-like autosuggestions  
  - **zsh-vi-mode** – vi mode for zsh  
- **tmux** – terminal multiplexer  
- **zoxide** – smarter `cd` command  

#### File Management & Navigation
- **yazi** – modern terminal file manager  
- **fzf** – fuzzy finder for quick navigation  
- **eza** – modern `ls` replacement with colors and icons  

#### Editor & Development
- **nvim** – Neovim with extensive LSP configuration  
  - LSP, completion, formatting, and more  
  - Custom keybindings and plugins via lazy.nvim  

#### Audio & Media
- **pipewire** – modern audio server  
- **amixer** – ALSA mixer for volume control  
- **pavucontrol** – PulseAudio volume control GUI  

---

### 🖥️ Applications
- **Firefox** – web browser  
- **VS Code** – code editor  
- **Thunar** – file manager  
- **Blueberry** – Bluetooth manager  

---

### 📜 System Files
- **.xinitrc** – X session initialization  
- **.Xresources** – X11 terminal colors and fonts (Kanagawa Dragon theme)  
- **.zprofile** – auto-start X on login to tty1  
- **.scripts/** – custom shell scripts (power menu, battery monitor, etc.)  

---

### ✨ Fonts
- **Iosevka SS04** – programming font  
- **Symbols Nerd Font** – icon glyphs  

---

### 📸 Preview
![dwm](./preview.png)

