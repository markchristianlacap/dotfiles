local hyper = { "cmd", "alt", "ctrl", "shift" }
local apps = {
  terminal = "kitty",
  browser = "Firefox",
}
local wf = hs.window.filter.default
local function toggle(app)
  local appObj = hs.application.get(app)
  if appObj and appObj:isFrontmost() then
    appObj:hide()
  else
    hs.application.launchOrFocus(app)
  end
end
-- App bindings
hs.hotkey.bind({ "alt", "shift" }, "return", function()
  toggle(apps.terminal)
end)

hs.hotkey.bind({ "alt", "shift" }, "P", function()
  hs.execute("export MOZ_DISABLE_SAFE_MODE_KEY=1 && open -a Firefox")
end)

-- Bind focus movements (Example: Cmd + Alt + Ctrl + H/J/K/L)
hs.hotkey.bind(hyper, "H", function() wf:focusWindowWest() end)
hs.hotkey.bind(hyper, "L", function() wf:focusWindowEast() end)
hs.hotkey.bind(hyper, "K", function() wf:focusWindowNorth() end)
hs.hotkey.bind(hyper, "J", function() wf:focusWindowSouth() end)
local resize_step = 40 -- pixels to move per keypress

local function resizeWindow(direction)
  local win = hs.window.focusedWindow()
  if not win then return end

  local f = win:frame()

  if direction == "expand_x" then
    f.w = f.w + resize_step
  elseif direction == "shrink_x" then
    f.w = f.w - resize_step
  elseif direction == "expand_y" then
    f.h = f.h + resize_step
  elseif direction == "shrink_y" then
    f.h = f.h - resize_step
  end

  win:setFrame(f)
end

-- Bindings (using Alt + Arrows for resizing)
hs.hotkey.bind({ "alt", "shift" }, "Right", function() resizeWindow("expand_x") end)
hs.hotkey.bind({ "alt", "shift" }, "Left", function() resizeWindow("shrink_x") end)
hs.hotkey.bind({ "alt", "shift" }, "Down", function() resizeWindow("expand_y") end)
hs.hotkey.bind({ "alt", "shift" }, "Up", function() resizeWindow("shrink_y") end)
