local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font = wezterm.font({ -- Normal text
  family = "Monaspace Neon",
  harfbuzz_features = {
    "calt",
    "liga",
    "ss01",
    "ss02",
    "ss03",
    "ss04",
    "ss05",
    "ss06",
    "ss07",
    "ss08",
    "ss09",
  },
})
config.font_rules = {
  { -- Italic
    intensity = "Normal",
    italic = true,
    font = wezterm.font({
      family = "Monaspace Radon", -- courier-like
      style = "Italic",
    }),
  },
  { -- Bold
    intensity = "Bold",
    italic = false,
    font = wezterm.font({
      family = "Monaspace Argon",
      weight = "Bold",
    }),
  },

  { -- Bold Italic
    intensity = "Bold",
    italic = true,
    font = wezterm.font({
      family = "Monaspace Radon",
      style = "Italic",
      weight = "Bold",
    }),
  },
}
config.font_size = 14
config.color_scheme = "Kanagawa (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.detect_password_input = false
config.warn_about_missing_glyphs = true
return config
