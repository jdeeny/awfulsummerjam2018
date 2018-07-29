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

  Line.drawh(1,1,self.cw, self.options.ul or '╒', self.options.top or '═', self.options.ur or '╕')
  local left = (self.cw - #self.title - 2) / 2
  local right = self.cw - #self.title - 2 - left
  local header = '├'..string.rep('─', left-1).." "..self.title.." "..string.rep('─', right-1)..'┤'
  self:print(1,2, header)--, Palette.Frame)
  Line.drawh(1,self.ch,self.cw, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
  Line.drawv(1,3, self.ch-2, self.options.left or '│')
  Line.drawv(self.cw,2, self.ch-2, self.options.right or '│')
  love.graphics.setColor(Palette.Heading)
end

return Panel
