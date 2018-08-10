local Screen = {}

local Loc = class('Loc')
function Loc:initialize(kind, ...)
  self.kind = type(kind) == 'string' and kind or error('kind must be a string')
  self.n = #{...}
  self.values = {}
  for i, v in ipairs({...}) do
    self.values[i] = v
  end
end

function Loc:as(kind)
  if not Screen.units[kind] then error('No unit called ' .. tostring(kind)) end
  if kind == self.kind then return unpack(self.values) end
  print("loc not same kind")

  local px_vals = {}
  for i, v in ipairs(self.values) do
    local o = Screen.units[self.kind].offset[i]
    local s = Screen.units[self.kind].px_per[i]
    px_vals[i] = (v - o) * s
  end

  if kind == 'px' then return unpack(px_vals) end

  local new_vals = {}
  for i, v in ipairs(self.values) do
    local o = Screen.units[kind].offset[i]
    local s = Screen.units[kind].px_per[i]
    new_vals[i] =  (v / s) + o
  end

  return unpack(new_vals)
end

function Loc:to(kind)
  return Loc:new(kind, self:as(kind))
end


local Dist = class('Dim')
function Dist:initialize(kind, ...)
  self.kind = type(kind) == 'string' and kind or error('kind must be a string')
  self.n = #{...}
  self.values = {}
  for i, v in ipairs({...}) do
    self.values[i] = v
  end
end


function Dist:as(kind)
  if not Screen.units[kind] then error('No unit called ' .. tostring(kind)) end
  if kind == self.kind then return unpack(self.values) end
print("dist not same kind")
  local px_vals = {}
  for i, v in ipairs(self.values) do
    local s = Screen.units[self.kind].px_per[i]
    print("pxper:"..s)
    px_vals[i] =  v * s
  end

  if kind == 'px' then return unpack(px_vals) end

  local new_vals = {}
  for i, v in ipairs(self.values) do
    local s = Screen.units[kind].px_per[i]
    new_vals[i] = v / s
  end


  return unpack(new_vals)
end

function Dist:to(kind)
  return Dist:new(kind, self:as(kind))
end

-- returns the `Dist` self - b
function Loc:__sub(b)
  local b = b.kind == self.kind and b or b:to(self.kind)
  local new_vals = map(function(a, b) return a - b end,
  pl.tablex.zip(self.values, b.values))
  return Dist:new(self.kind, new_vals)
end

function Dist:__add(b)
  local b = b.kind == self.kind and b or b:to(self.kind)
  local new_vals = map(function(a, b) return a + b end,
  pl.tablex.zip(self.values, b.values))
  return Dist:new(self.kind, new_vals)
end

Screen.units = { px = { name = 'px', px_per = {1, 1}, offset = {0, 0}, return_int = false }}

-- number of pixels per unit
function Screen.set_unit(name, px_per, offset, return_int)
  Screen.units[name] = { name = name, px_per = px_per, offset = offset, return_int = return_int }
end

--[[function Screen.tocharsremainder(x, y)
  return (x % Screen.char_width, y % Screen.char_height)
end]]


function Screen.do_resize(w, h)
  -- TODO: Figure out char scaling and stuff
end

Screen.Loc = Loc
Screen.Dist = Dist
Screen.do_resize(love.graphics.getPixelDimensions())
return Screen
