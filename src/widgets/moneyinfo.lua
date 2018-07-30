local MoneyInfo = class('MoneyInfo', Widget)

function MoneyInfo:initialize(x,y,w, value, options)
  Widget.initialize(self,x,y,w,1)
  self.options = options or {}
  self.value = value or 0.0
end

function MoneyInfo:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  if self.options.color then
    love.graphics.setColor(self.options.color)
  else
    love.graphics.setColor((self.value > 0 and Palette.MoneyGood) or (self.value <0 and Palette.MoneyBad) or Palette.MoneyNeutral)
  end
  love.graphics.setFont(Text.ibmfont)
  love.graphics.print(Text.dollars(self.value), 0, 0)
  love.graphics.setCanvas()
end

function MoneyInfo:set_value(value)
  self.value = value or self.value
  self.clean = false
end

return MoneyInfo
