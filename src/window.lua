local Window = class('Window')


-- Create a new Window, at (x,y), w wide and h high. Coords are text coords
function Window:initialize(x, y, w, h)
  self.contents = { }
  self.cw, self.ch = w, h
  self.px, self.py = Screen.topixels(x or 0, y or 0)
  self.pw, self.ph = Screen.topixels(w or 1, h or 1)

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.setColor(Palette.PureWhite:get_color())
  love.graphics.clear(Palette.Violet:get_color())
  --[[lines.draw_vert(0, 0, self.ch-2)
  lines.draw_vert(self.cw-1, 0, self.ch-2)
  lines.draw_horiz(self.ch-1, 1, self.cw-2)
  lines.draw_ll(0, self.ch-1)
  lines.draw_lr(self.cw-1, self.ch-1)]]
  love.graphics.setCanvas()
  --self:rollup()
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

function Window:add(item)
  table.insert(self.contents, item)
  print("Add ")
end

function Window:draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Violet:get_color())
  for i,v in ipairs(self.contents) do
    print("Dr  ")-- .. pl.pretty.dump(v))
    v:draw_widget(0, 0)
  end
  love.graphics.setCanvas()
  love.graphics.setColor(Palette.PureWhite:get_color())
  love.graphics.draw(self.canvas, self.px, self.py)
  print(self.px.. " " .. self.py.. "   "..self.pw.." " ..self.ph)
end

return Window
