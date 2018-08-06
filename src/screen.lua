local Screen = {}
local HasDimension = {
  _init = function(self, kind, ...)
      if type(kind) ~= 'string' then error ("kind must be a string") end
      local values type(...[1]) == 'table' and ...[1] or ... or {}
      if type(...[1]) == 'table' then
        values = ...[1]
      else
        values = ...
      end
      self.kind = kind
      self.values = pl.tablex.copy(values)
      self.n = #self.values
    end

  end,
}

local Loc = class('Loc')
Loc:include(HasDimension)

function Loc:initialize(kind, ...)
  self:_init(kind, ...)
end

function Loc:to(kind)
  if not Screen.units[kind] then error('No unit called ' .. tostring(kind)) end
  if kind == self.kind then return Loc:new(kind, self.values) end

  local px_vals = map(function(v, s, o) return (v-o) * s  end,
                      pl.tablex.zip(self.values, Screen.units.px.px_per, Screen.units.px.offset ))

  if kind == 'px' then return Loc:new(kind, px_vals) end

  local new_vals = map(function(v, s, o) return (v / s) + o  end,
                      pl.tablex.zip(self.values, Screen.units.px.px_per, Screen.units.px.offset ))

  return Loc:new(kind, new_vals)
end


local Dist = class('Dim')
Dist:include(HasDimension)
function Dist:initialize(kind, ...)
  self:_init(kind, ...)
end
function Dist:to(kind)
  if not Screen.units[kind] then error('No unit called ' .. tostring(kind)) end
  if kind == self.kind then return Dist:new(kind, self.values) end

  local px_vals = map(function(v, s) return v * s  end,
                      pl.tablex.zip(self.values, Screen.units.px.px_per ))

  if kind == 'px' then return Dist:new(kind, px_vals) end

  local new_vals = map(function(v, s) return v / s end,
                      pl.tablex.zip(self.values, Screen.units.px.px_per ))

  return Dist:new(kind, new_vals)
end

-- returns the `Dist` self - b
function Loc:__sub(b)
  local b = b.kind == self.kind and b or b:to(self.kind)
  local new_vals = map(function(a,b) return a - b, end,
                      pl.tablex.zip(self.values, b.values))
  return Dist:new(self.kind, new_vals)
end

function Dist:__add(b)
  local b = b.kind == self.kind and b or b:to(self.kind)
  local new_vals = map(function(a, b) return a + b, end,
                      pl.tablex.zip(self.values, b.values))
  return Dist:new(self.kind, new_vals)
end


-- Initialize with pixel width/height
function Screen:initialize(pw, ph)
  self.units = {
    px = { name='px', px_per = {1,1}, off={0,0} }
  }
end

-- number of pixels per unit
function Screen:set_unit(name, px_per, offset, return_int)
  self.units[name] = { name=name, px_per=px_per, offset = offset, return_int = return_int }
end


Screen.char_width = 8
Screen.char_height = 16


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
