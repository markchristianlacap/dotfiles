# 🔨 Hammerspoon

Tiling window manager for macOS. dwm-inspired master-stack layout with vim keybindings.

---

## ⌨️ Keybindings

**Hyper** = `⌘ + ⌥ + ⌃ + ⇧`

| Key | Action |
|-----|--------|
| `Hyper + j/k` | Focus next/prev window |
| `Hyper + h/l` | Shrink/grow master width |
| `Hyper + Return` | Apply tiling layout |
| `Hyper + Space` | Raise window and retile |
| `Hyper + m` | Maximize window |
| `⌥⇧ + h/l` | Snap left/right |
| `Hyper + t` | Launch terminal (Kitty) |
| `Hyper + e` | Launch Finder |
| `Hyper + p` | Launch Firefox |
| `Hyper + r` | Reload configuration |

---

## 🏗️ Layout

```
┌─────────────┬─────────┐
│             │ Stack 1 │
│   Master    ├─────────┤
│   (60%)     │ Stack 2 │
│             ├─────────┤
│             │ Stack 3 │
└─────────────┴─────────┘
```

- First window = Master (60% width)
- Additional = Stacked right (40% width)
- Master ratio adjustable 20-80%

---

## 🚀 Install

```bash
brew install hammerspoon
ln -sf ~/.dotfiles/.hammerspoon ~/.hammerspoon
```

Open Hammerspoon → Enable "Launch at login" → Grant Accessibility permissions

---

## ⚙️ Customize

Edit `init.lua`:

```lua
-- Change apps (line 8)
local apps = {
  terminal = "kitty",
  browser  = "Firefox",
  explorer = "Finder",
}

-- Adjust master width (line 15)
local masterRatio = 0.6  -- 60/40 split
```

Reload with `Hyper + r` or menu bar → Reload Config
