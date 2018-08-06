local Panel = class('Panel', Widget)
function Panel:initialize(options)
  self.options = options or {}
  Widget.initialize(self, options)
  self.title = options.title or ""

  self.contents = {}
end


--[[function Panel:_draw()
  love.graphics.setCanvas(self.canvas)

  love.graphics.clear(Palette.Background)
  love.graphics.setColor(Palette.Frame)
  Line.drawh(1,1,self.cw, self.options.ul or '╒', self.options.top or '═', self.options.ur or '╕')
  local left = (self.cw - #self.title - 2) / 2
  local right = self.cw - #self.title - 2 - left
  local header = '├'..string.rep('─', left-1).." "..self.title.." "..string.rep('─', right-1)..'┤'
  self:print(1,2, header)--, Palette.Frame)
  Line.drawh(1,self.ch,self.cw, self.options.ll or '└', self.options.bot or '─', self.options.ur or '┘')
  Line.drawv(1,2, self.ch-2, self.options.left or '│')
  Line.drawv(self.cw,2, self.ch-2, self.options.right or '│')
  love.graphics.setColor(Palette.Heading)
end]]


function Panel:_measure(available_w, available_h)
  local w = self.options.padding.left + self.options.padding.right +
            self.options.margin.left + self.options.padding.right +
            (self.w or 0)

  local h = self.options.padding.top + self.options.padding.bottom +
            self.options.margin.top + self.options.margin.bottom +
            (self.h or 0)

  -- add up all children

  self.desired_size = { w, h }
  return { w, h }
end

function Panel:_arrange(allowed_w, allowed_h)
  -- for each child, arrange w/ their allowed_w/h
end

return Panel
