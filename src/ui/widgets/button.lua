local Button = class('Button', Widget)

local DefaultWidth = 16
local DefaultHeight = 5

function Button:initialize(text, options)
  self.options = options or {}
  self.text = text or "A Button"

  --local w, h = self.options.w or DefaultWidth, self.options.h or DefaultHeight
  --Widget.initialize(self, w, h)

  self.mode = ''
  self.old_mode = ''
end

function Button:click(x,y)
  if self._onclick then self:_onclick(x,y) end
end

function Button:_onclick(x, y)
  --print("click in button")
  local x, y = x - self.px, y - self.py
  if x >= 0 and y >= 0 and x <= self.pw and y <= self.ph then
    print("Click button inside: " .. self.text .." ".. x.. " " .. y)
    if type(self.options.onclick) == 'function' then
      print("click")
      self.options.onclick()
    end
  else
    --print("Click outside button: " .. self.text .." ".. x.. " " .. y)
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
  --print("draw button mode: ".. self.mode)
  love.graphics.setCanvas(self.canvas)

  local framecolor = Palette.Frame
  local headingcolor = Palette.Heading
  if self.mode == 'mouseover' then
    framecolor = Palette.HoverFrame
  elseif self.mode == 'click' then
    framecolor = Palette.ClickFrame
  end
  love.graphics.clear(Palette.Background)
    love.graphics.setColor(framecolor)
    Line.drawh(1,1,self.cw, self.options.ul or '┌', self.options.top or '─', self.options.ur or '┐')
    Line.drawh(1,self.ch,self.cw, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
    Line.drawv(1,2, self.ch-2, self.options.left or '│')
    Line.drawv(self.cw,2, self.ch-2, self.options.right or '│')
    love.graphics.setColor(headingcolor)

    local x, y = Text.center(#self.text, self.cw), Text.center(1, self.ch)
    self:print(x,y,self.text)
end

return Button
