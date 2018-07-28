local Button = class('Button', Widget)

function Button:initialize(x, y, w, h, text, options)
  Widget.initialize(self, x, y, w, h)

  self.text = text or "butt on"
  self.mode = ''
  self.old_mode = ''
  self.click = false
end

function Button:_onclick(x, y)
  if x >= 0 and y >= 0 and x <= self.pw and y <= self.ph then
    print("Click button inside: " .. self.text .." ".. x.. " " .. y)
  else
    print("Click button: " .. self.text .." ".. x.. " " .. y)
  end
  self.mode = 'click'
end

function Button:_update_mouse(x, y, clicked)
  if x >= self.px and x <= self.px + self.pw and
     y >= self.py and y <= self.py + self.ph then
    --if love.mousepressed then _onclick
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
    love.graphics.print(self.text, Text.center(#self.text * 8, self.pw), 16)
  elseif self.mode == 'click' then
    print("clickmode")
    self.mode = ''
  else
    love.graphics.clear(Palette.AquaBlue)
    love.graphics.setColor(Palette.Green)
    love.graphics.print('Normal', 0, 0)
    love.graphics.print(self.text, Text.center(#self.text * 8, self.pw), 16)
  end
end

return Button
