local StatusPage = class('StatusPage', Widget)

local row1 = 4
local row2 = 20
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3

function StatusPage:initialize(w, h)
  Widget.initialize(self, w, h)

  self.rankings_panel = Widgets.Panel:new({title="BOX OFFICE"})
  self.bo_panel = Widgets.BoxOfficePanel:new()
  self.rankings_panel:add(self.bo_panel)
  self.finance_panel = Widgets.Panel:new({title="STUDIO FINANCES"})
  self.feed_panel = Widgets.Panel:new({title="NEWS FEED"})
  self.feed_panel:add(Widgets.NewsFeed:new())
--  self.projects_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  self.finance_panel:add(Widgets.ProfitGraph:new())-- colw-2, 18))

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
