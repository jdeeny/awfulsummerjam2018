local Widget = class('Widget')


-- Create a new Widget, at (x,y), w wide and h high. Coords are text coords
function Widget:initialize(x, y, w, h, bgcolor)
  self.contents = { }
  self.bgcolor = bgcolor or { 0, 0, 0, 0}
  self.cw, self.ch = w, h
  self.px, self.py = Screen.topixels(x or 0, y or 0)
  self.pw, self.ph = Screen.topixels(w or 0, h or 0)

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  love.graphics.setCanvas()
end

function Widget:add(item)
  table.insert(self.contents, item)
end

function Widget:update(dt)

end

function Widget:draw()
  if self.canvas then
    love.graphics.draw(self.canvas, self.px, self.py)
  else
    print("No canvas?")
  end
end

function Widget:draw_widget(xoff, yoff)
  print("!")
  local xoff = xoff or 0
  local yoff = yoff or 0
  local x = self.px + xoff
  local y = self.py + yoff
  love.graphics.draw(self.canvas, x, y)
  for i,v in ipairs(self.contents) do
    v:draw_widget(x, y)
  end
end

return Widget
