local StatusPage = class('StatusPage', Widget)

local row1 = 10
local row2 = 20
local col1 = 1
local col2 = 60
local colw = 55

function StatusPage:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)

  self.rankings_panel = Widgets.Panel:new(col1,row1,colw,20, "Box Offing Rankings")
  self.finance_panel = Widgets.Panel:new(col1,row2,colw, 20, "Studio Finances")
  self.feed_panel = Widgets.Panel:new(col2,row1,colw,self.ch - 5, "News Feed")

  self.finance_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  self:add(self.rankings_panel)
  self:add(self.finance_panel)
  self:add(self.feed_panel)
end

function StatusPage:_draw()
  love.graphics.setCanvas(self.canvas)

  love.graphics.clear(Palette.Background)
  love.graphics.setColor(Palette.Frame)

  Line.drawh(1,1,self.cw, '╒', '═', '╕')
  Line.drawh(1,self.ch-2,self.cw, '╠', '═', '╣')
  Line.drawh(1,self.ch,self.cw, '╚', '═', '╝')
  self:print(1,self.ch-1, '║')
  self:print(self.cw,self.ch-1, '║')
  Line.drawv(1,2, self.ch-4, '║')
  Line.drawv(self.cw,2, self.ch-4,'║')
end


return StatusPage
