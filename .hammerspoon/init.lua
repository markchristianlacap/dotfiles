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
local windowFilter = hs.window.filter.new()

local function findWindowIndex(wins, target)
  if not target then return nil end

  local targetId = target:id()
  for i, win in ipairs(wins) do
    if win:id() == targetId then
      return i
    end
  end

  return nil
end

local function cycleIndex(idx, count, direction)
  if direction == "next" then
    return (idx % count) + 1
  end

  return ((idx - 2 + count) % count) + 1
end

-- get visible windows on main screen, sorted left to right
local function getSortedWindows()
  local screen = hs.screen.mainScreen()
  local wins = windowFilter:getWindows()

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

  if direction == "left" then
    win:setFrame({ x = f.x, y = f.y, w = f.w / 2, h = f.h })
  elseif direction == "right" then
    win:setFrame({ x = f.x + f.w / 2, y = f.y, w = f.w / 2, h = f.h })
  elseif direction == "full" then
    win:setFrame({ x = f.x, y = f.y, w = f.w, h = f.h })
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
      local y = f.y + (i - 2) * sh
      local h = (i == #wins) and (f.h - (sh * (#wins - 2))) or sh

      wins[i]:setFrame({
        x = f.x + mw,
        y = y,
        w = f.w - mw,
        h = h
      })
    end
  end
end

-- move focus between windows
local function moveFocus(direction)
  local wins = getSortedWindows()
  local active = hs.window.focusedWindow()
  if not active or #wins < 2 then return end

  local idx = findWindowIndex(wins, active)
  if not idx then return end

  local nextIdx = cycleIndex(idx, #wins, direction)
  wins[nextIdx]:focus()
end

local function swapWith(direction)
  local wins = getSortedWindows()
  local active = hs.window.focusedWindow()
  if not active or #wins < 2 then return end

  local idx = findWindowIndex(wins, active)
  if not idx then return end

  local targetIdx = cycleIndex(idx, #wins, direction)

  local currentWin = wins[idx]
  local targetWin = wins[targetIdx]

  local currentFrame = currentWin:frame()
  local targetFrame = targetWin:frame()
  currentWin:setFrame(targetFrame)
  targetWin:setFrame(currentFrame)
  currentWin:focus()
end

local function promoteToMaster()
  local wins = getSortedWindows()
  local active = hs.window.focusedWindow()
  if not active or #wins < 2 then
    tile()
    return
  end

  local activeIdx = findWindowIndex(wins, active)

  if not activeIdx then return end

  local activeFrame = wins[activeIdx]:frame()
  local masterFrame = wins[1]:frame()
  wins[activeIdx]:setFrame(masterFrame)
  wins[1]:setFrame(activeFrame)
  wins[activeIdx]:focus()
  tile()
  active:focus()
end

-- focus navigation
hs.hotkey.bind(hyper, "j", function() moveFocus("next") end)
hs.hotkey.bind(hyper, "k", function() moveFocus("prev") end)

-- dwm-style stack move
hs.hotkey.bind(altShift, "j", function() swapWith("next") end)
hs.hotkey.bind(altShift, "k", function() swapWith("prev") end)

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
hs.hotkey.bind(hyper, "return", promoteToMaster)
hs.hotkey.bind(altShift, "return", tile)

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

hs.hotkey.bind(hyper, "c", function()
  local w = hs.window.focusedWindow()
  if w then w:close() end
end)
hs.alert.show("Config loaded")
