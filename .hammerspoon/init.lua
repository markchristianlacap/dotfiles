hs.window.animationDuration = 0

-- modifiers
local hyper = { "cmd", "alt", "ctrl", "shift" }
local altShift = { "alt", "shift" }

-- apps
local apps = {
  terminal = "kitty",
  browser  = "Brave Browser",
  explorer = "Finder",
}

-- layout ratio
local masterRatio = 0.6

-- get visible windows on main screen, sorted left to right
local function getSortedWindows()
  local screen = hs.screen.mainScreen()
  local wins = hs.window.filter.new():getWindows()

  local filtered = hs.fnutils.filter(wins, function(win)
    return win:screen() == screen and win:isStandard()
  end)

  table.sort(filtered, function(a, b)
    local fa, fb = a:frame(), b:frame()
    return (fa.x ~= fb.x) and (fa.x < fb.x) or (fa.y < fb.y)
  end)

  return filtered
end

-- snap focused window
local function snap(direction)
  local win = hs.window.focusedWindow()
  if not win then return end

  local f = win:screen():frame()

  local layout = {
    left  = { x = f.x, y = f.y, w = f.w / 2, h = f.h },
    right = { x = f.x + f.w / 2, y = f.y, w = f.w / 2, h = f.h },
    full  = { x = f.x, y = f.y, w = f.w, h = f.h },
  }

  if layout[direction] then
    win:setFrame(layout[direction])
  end
end

-- apply tiling layout
local function tile()
  local wins = getSortedWindows()
  if #wins == 0 then return end

  local f = hs.screen.mainScreen():frame()
  local mw = math.floor(f.w * masterRatio)

  -- master window
  wins[1]:setFrame({
    x = f.x,
    y = f.y,
    w = (#wins == 1) and f.w or mw,
    h = f.h
  })

  -- stack windows
  if #wins > 1 then
    local sh = math.floor(f.h / (#wins - 1))

    for i = 2, #wins do
      wins[i]:setFrame({
        x = f.x + mw,
        y = f.y + (i - 2) * sh,
        w = f.w - mw,
        h = sh
      })
    end
  end
end

-- move focus between windows
local function moveFocus(direction)
  local wins = getSortedWindows()
  local active = hs.window.focusedWindow()
  if not active or #wins < 2 then return end

  local idx = 1
  for i, w in ipairs(wins) do
    if w:id() == active:id() then
      idx = i
      break
    end
  end

  local nextIdx
  if direction == "next" then
    nextIdx = (idx % #wins) + 1
  else
    nextIdx = ((idx - 2 + #wins) % #wins) + 1
  end

  wins[nextIdx]:focus()
end

-- focus navigation
hs.hotkey.bind(hyper, "j", function() moveFocus("next") end)
hs.hotkey.bind(hyper, "k", function() moveFocus("prev") end)

-- adjust master size
hs.hotkey.bind(hyper, "h", function()
  masterRatio = math.max(0.2, masterRatio - 0.05)
  tile()
end)

hs.hotkey.bind(hyper, "l", function()
  masterRatio = math.min(0.8, masterRatio + 0.05)
  tile()
end)

-- layout controls
hs.hotkey.bind(hyper, "m", function() snap("full") end)
hs.hotkey.bind(hyper, "return", tile)

hs.hotkey.bind(hyper, "space", function()
  local w = hs.window.focusedWindow()
  if w then
    w:raise()
    tile()
  end
end)

-- manual snap
hs.hotkey.bind(altShift, "h", function() snap("left") end)
hs.hotkey.bind(altShift, "l", function() snap("right") end)

-- app launchers
hs.hotkey.bind(hyper, "t", function()
  hs.application.launchOrFocus(apps.terminal)
end)

hs.hotkey.bind(hyper, "e", function()
  hs.application.launchOrFocus(apps.explorer)
end)

hs.hotkey.bind(hyper, "p", function()
  hs.application.launchOrFocus(apps.browser)
end)

-- reload config
hs.hotkey.bind(hyper, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
