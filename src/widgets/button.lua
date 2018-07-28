local Button = class('Button', Widget)

function Button:initialize(x, y, w, h, text, options)
  Widget.initialize(self, x, y, w, h)

  self.options = options or {}
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
    love.graphics.clear(Palette.Background)
    love.graphics.setColor(Palette.HoverFrame)
    Line.drawh(1,1,self.cw-1, self.options.ul or '┌', self.options.top or '─', self.options.ur or '┐')
    Line.drawh(1,self.ch-1,self.cw-1, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
    Line.drawv(1,2, self.ch-3, self.options.left or '│')
    Line.drawv(self.cw-1,2, self.ch-3, self.options.right or '│')
    love.graphics.setColor(Palette.Heading)
    local x, y = Text.center(#self.text, self.cw), Text.center(1, self.ch)
    x, y = Screen.topixels(x,y)
    love.graphics.print(self.text, x, y)
  elseif self.mode == 'click' then
    love.graphics.clear(Palette.Background)
    love.graphics.setColor(Palette.ClickFrame)
    Line.drawh(1,1,self.cw-1, self.options.ul or '┌', self.options.top or '─', self.options.ur or '┐')
    Line.drawh(1,self.ch-1,self.cw-1, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
    Line.drawv(1,2, self.ch-3, self.options.left or '│')
    Line.drawv(self.cw-1,2, self.ch-3, self.options.right or '│')
    love.graphics.setColor(Palette.Heading)
    local x, y = Text.center(#self.text, self.cw), Text.center(1, self.ch)
    x, y = Screen.topixels(x,y)
    love.graphics.print(self.text, x, y)
  else
    love.graphics.clear(Palette.Background)
    love.graphics.setColor(Palette.Frame)
    Line.drawh(1,1,self.cw-1, self.options.ul or '┌', self.options.top or '─', self.options.ur or '┐')
    Line.drawh(1,self.ch-1,self.cw-1, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
    Line.drawv(1,2, self.ch-3, self.options.left or '│')
    Line.drawv(self.cw-1,2, self.ch-3, self.options.right or '│')
    love.graphics.setColor(Palette.Heading)
    local x, y = Text.center(#self.text, self.cw), Text.center(1, self.ch)
    x, y = Screen.topixels(x,y)
    love.graphics.print(self.text, x, y)
  end
--[[  elseif self.mode == 'click' then
    print("clickmode")
    self.mode = ''
    love.graphics.clear(Palette.AquaBlue)
    love.graphics.setColor(Palette.Green)
    love.graphics.print('Normal', 0, 0)
    love.graphics.print(self.text, Text.center(#self.text * 8, self.pw), 16)
  end]]
end

return Button
