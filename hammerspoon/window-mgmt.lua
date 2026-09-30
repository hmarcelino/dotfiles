-- Smooth window move/resize with the keyboard
hs.window.animationDuration = 0

-- Tunables (points per second)
local fps      = 60
local minSpeed = 400    -- speed at the moment you press
local maxSpeed = 1800   -- top speed while holding
local accel    = 2500   -- speed gained per second held

local mv = {"cmd", "shift"}           -- move
local rs = {"cmd", "alt", "shift"}  -- resize

local timer = nil

local function stopTimer()
  if timer then timer:stop(); timer = nil end
end

-- True while every modifier in `mods` is still held
local function modsHeld(mods)
  local flags = hs.eventtap.checkKeyboardModifiers()
  for _, m in ipairs(mods) do
    if not flags[m] then return false end
  end
  return true
end

-- kind: "move" or "resize"; (dirX, dirY) is the direction, e.g. (-1, 0)
local function bindHold(mods, key, kind, dirX, dirY)
  local function onPress()
    stopTimer()
    local win = hs.window.focusedWindow()
    if not win then return end

    local start = hs.timer.secondsSinceEpoch()
    local last = start
    local remX, remY = 0, 0  -- fractional pixels carried between ticks

    timer = hs.timer.doEvery(1 / fps, function()
      -- Safety: stop if modifiers were released before the arrow key
      if not modsHeld(mods) then stopTimer(); return end

      local now = hs.timer.secondsSinceEpoch()
      local dt = now - last
      last = now

      local speed = math.min(maxSpeed, minSpeed + accel * (now - start))
      remX = remX + dirX * speed * dt
      remY = remY + dirY * speed * dt

      -- Whole pixels to apply this tick; keep the remainder
      local ix = remX >= 0 and math.floor(remX) or math.ceil(remX)
      local iy = remY >= 0 and math.floor(remY) or math.ceil(remY)
      remX, remY = remX - ix, remY - iy
      if ix == 0 and iy == 0 then return end

      if kind == "move" then
        local p = win:topLeft()
        win:setTopLeft({x = p.x + ix, y = p.y + iy})
      else
        local s = win:size()
        win:setSize({w = s.w + ix, h = s.h + iy})
      end
    end)
  end

  hs.hotkey.bind(mods, key, onPress, stopTimer)  -- no OS repeat needed
end

-- Move
bindHold(mv, "left",  "move", -1,  0)
bindHold(mv, "right", "move",  1,  0)
bindHold(mv, "up",    "move",  0, -1)
bindHold(mv, "down",  "move",  0,  1)

-- Resize
bindHold(rs, "left",  "resize", -1,  0)
bindHold(rs, "right", "resize",  1,  0)
bindHold(rs, "up",    "resize",  0, -1)
bindHold(rs, "down",  "resize",  0,  1)

-- Exact size and position (example: 1280x720 at 100,100)
hs.hotkey.bind(mv, "0", function()
  local win = hs.window.focusedWindow()
  if win then win:setFrame({x = 100, y = 100, w = 1280, h = 720}, 0) end
end)
