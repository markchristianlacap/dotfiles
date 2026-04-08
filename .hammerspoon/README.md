# 🔨 Hammerspoon

Tiling window manager for macOS. dwm-inspired master-stack layout with vim keybindings.

---

## ⌨️ Keybindings

**Hyper** = `⌘ + ⌥ + ⌃ + ⇧`

| Key | Action |
|-----|--------|
| `Hyper + j/k` | Focus next/prev window |
| `⌥⇧ + j/k` | Swap focused window with next/prev |
| `Hyper + h/l` | Shrink/grow master width |
| `Hyper + Return` | Promote focused window to master and retile |
| `⌥⇧ + Return` | Apply tiling layout |
| `Hyper + Space` | Raise window and retile |
| `Hyper + m` | Maximize window |
| `⌥⇧ + h/l` | Snap left/right |
| `Hyper + t` | Launch terminal (Kitty) |
| `Hyper + e` | Launch Finder |
| `Hyper + p` | Launch Brave Browser |
| `Hyper + c` | Close focused window |
| `Hyper + r` | Reload configuration |

---

## 🪟 dwm Comparison

| Action | dwm (typical) | This config |
|--------|----------------|-------------|
| Focus next | `Mod + j` | `Hyper + j` |
| Focus previous | `Mod + k` | `Hyper + k` |
| Swap with next | `Mod + Shift + j` | `⌥⇧ + j` |
| Swap with previous | `Mod + Shift + k` | `⌥⇧ + k` |
| Promote to master | `Mod + Return` | `Hyper + Return` |
| Spawn terminal | `Mod + Shift + Return` | `Hyper + t` |
| Grow master width | `Mod + l` | `Hyper + l` |
| Shrink master width | `Mod + h` | `Hyper + h` |
| Kill focused window | `Mod + Shift + c` | `Hyper + c` |

`Mod` in dwm is usually `Alt` or `Super`.

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
