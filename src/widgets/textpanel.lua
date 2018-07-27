local TextPanel = class('TextPanel', Widget)

function TextPanel:initialize(x, y, w, h, color, txt)
  Widget.initialize(self, x, y, w, h)

  self.bgcolor = bgcolor or Palette.Black
  self.color = color or Palette.White
  self.w = w or 1
  self.h = h or 1

  self.clean = false
  self.txt = txt or "TEXT"
  self.old_txt = self.txt
end

function TextPanel:update(dt, x, y)
  Widget.update(self, dt, x, y)
  if self.txt ~= self.old_txt then
    self.clean = false
  end

  if not self.clean then
    self.old_txt = txt
    self:_draw()
    self.clean = true
  end
end

function TextPanel:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  love.graphics.setColor(self.color)
  love.graphics.setFont(Text.ibmfont)
  love.graphics.print(self.txt, 0, 0)
  love.graphics.setCanvas()
end

return TextPanel
