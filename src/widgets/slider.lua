local Slider = class('Slider', Widget)

function Slider:initialize(value, range, w, h)
  self.w = w or 1
  self.h = h or 1
  self.horizontal = self.w > self.h
  self.range = range or { 0, 100 }
  self.clean = false
  self.value = value or 0
  self.old_value = self.value
end

function Slider:update(dt)
  if self.value ~= self.old_value then
    self.clean = false
  end

  if not self.clean then
    self.old_value = value
    self:_draw()
    self.clean = true
  end
end

function Slider:_draw()
  self.canvas:clear(self.bgcolor)
  if self.horizontal then
  else
    for i = 1, h do
      local x, y = Screen.to_px_loc(i, 0)
      love.graphics.print(" # ", x, y)
    end
    local x, y = Screen.to_px_loc(0, self.value / self.range * self.height + 1)
    love.graphics.print(string.rep("#", self.width), x, y)
  end
end

return Slider
