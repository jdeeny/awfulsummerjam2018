local Window = class('Window')


-- Create a new Window, at (x,y), w wide and h high. Coords are text coords
function Window:initialize(x, y, w, h)
  self.contents = { }
  self.rolluptime = 0.8
  self.rolldowntime = 1.5
  self.cw, self.ch = w, h
  self.px, self.py = screen.topixels(x or 0, y or 0)
  self.pw, self.ph = screen.topixels(w or 0, h or 0)

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.setColor(Palette.PureWhite:get_color())
  love.graphics.clear(50,50,50)
  --[[lines.draw_vert(0, 0, self.ch-2)
  lines.draw_vert(self.cw-1, 0, self.ch-2)
  lines.draw_horiz(self.ch-1, 1, self.cw-2)
  lines.draw_ll(0, self.ch-1)
  lines.draw_lr(self.cw-1, self.ch-1)]]
  love.graphics.setCanvas()
  --self:rollup()
  print("!")
end

function Window:update(dt)

end

--[[function Window:rollup()
  local target = 0 - self.ph
  flux.to(self, self.rolluptime, { py = target } ):ease('quadin'):oncomplete(function() self:rolldown() end )
end

function Window:rolldown()
  flux.to(self, self.rolldowntime, { py = 0 } ):ease('elasticout')--:oncomplete(self:rollup())
end]]

function Window:draw()
  print(".")
  love.graphics.draw(self.canvas, self.px, self.py)
end

return Window
