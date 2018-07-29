local Panel = class('Panel', Widget)
function Panel:initialize(x, y, w, h, title, options)
  Widget.initialize(self, x, y, w, h)
  self.title = title or ""
  self.options = options or {}
end


function Panel:_draw()
  love.graphics.setCanvas(self.canvas)

  love.graphics.clear(Palette.Background)
  love.graphics.setColor(Palette.Frame)
  Line.drawh(1,1,self.cw-1, self.options.ul or '┌', self.options.top or '─', self.options.ur or '┐')
  Line.drawh(1,self.ch-1,self.cw-1, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
  Line.drawv(1,2, self.ch-3, self.options.left or '│')
  Line.drawv(self.cw-1,2, self.ch-3, self.options.right or '│')
  love.graphics.setColor(Palette.Heading)
  local x, y = Text.center(#self.title, self.cw), Text.center(1, self.ch)
  x, y = Screen.topixels(x,y)
  love.graphics.print(self.title, x, y)
end

return Panel
