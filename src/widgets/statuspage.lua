local StatusPage = class('StatusPage', Widget)

local row1 = 5
local row2 = 14
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3

function StatusPage:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)

  self.rankings_panel = Widgets.Panel:new(col1,row1,colw,20, "BOX OFFICE")
  self.finance_panel = Widgets.Panel:new(col1,row2,colw, 20, "STUDIO FINANCES")
  self.feed_panel = Widgets.Panel:new(col2,row1,colw,self.ch - 5, "NEWS FEED")
  self.feed_panel:add(Widgets.NewsFeed:new(col2+2,row1+3,self.feed_panel.cw-4,self.feed_panel.ch-4))
--  self.projects_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  self.finance_panel:add(Widgets.ProfitGraph:new(col1+1,row2+1,colw-2, 18))

  self:add(self.rankings_panel)
  self:add(self.finance_panel)
  self:add(self.feed_panel)
  self:add(self.projects_panel)

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
