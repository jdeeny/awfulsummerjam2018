local Widget = class('Widget')


-- Create a new Widget, at (x,y), w wide and h high. Coords are text coords
function Widget:initialize(x, y, w, h, bgcolor)
  self.contents = { }
  self.bgcolor = bgcolor or { 0, 0, 0, 0}
  self.cw, self.ch = w, h
  self.px, self.py = screen.topixels(x or 0, y or 0)
  self.pw, self.ph = screen.topixels(w or 0, h or 0)

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  love.graphics.setCanvas()
end

function Widget:update(dt)

end

function Widget:draw()
  self:draw_widget(0, 0)
end

function Widget:draw_widget(xoff, yoff)
  local x = self.px + xoff
  local y = self.py + yoff
  love.graphics.draw(self.canvas, x, y)
  for i,v in ipairs(self.contents) do
    v:draw_widget(x, y)
  end
end

return Widget
