local Button = class('Button', Widget)

function Button:initialize(x, y, w, h, xoff, yoff, text, options)
  Widget.initialize(self, x, y, w, h, xoff, yoff)

  self.text = text or "butt on"
  self.mode = ''
  self.old_mode = ''
end


function Button:_update_mouse(x, y)
  if x >= self.px and x <= self.px + self.pw and
     y >= self.py and y <= self.py + self.ph then
     self.mode = 'mouseover'
  else
    self.mode = ''
  end
end

function Button:update(dt, x, y)
  Widget.update(self, dt, x, y)

  if self.old_mode ~= self.mode then self.clean = false end
  self.old_mode = self.mode
end

function Button:_draw()
  print("draw button mode: ".. self.mode)
  love.graphics.setCanvas(self.canvas)
  if self.mode == 'mouseover' then
    love.graphics.clear(Palette.Green)
    love.graphics.setColor(Palette.AquaBlue)
    love.graphics.print('Mouseover', 0, 0)
  else
    love.graphics.clear(Palette.AquaBlue)
    love.graphics.setColor(Palette.Green)
    love.graphics.print('Normal', 0, 0)
  end
end

return Button
