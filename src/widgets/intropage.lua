local IntroPage = class('IntroPage', Widget)

local row1 = 4
local row2 = 14
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3

function IntroPage:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)

  self.rankings_panel = Widgets.Panel:new(col1,row1,colw,20, "BOX OFFICE")
  self.bo_panel = Widgets.BoxOfficePanel:new(col1+1, row1+4, colw-4, 16)
  self.rankings_panel:add(self.bo_panel)
  self.intro_panel = Widgets.Panel:new(col1,row2,colw, 20, "INTRODUCTION")
  self.feed_panel = Widgets.Panel:new(col2,row1,colw,self.ch - 5, "NEWS FEED")
  self.feed_panel:add(Widgets.NewsFeed:new(col2+2,row1+3,self.feed_panel.cw-4,self.feed_panel.ch-4))
  --self.finance_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  self:add(self.rankings_panel)
  self:add(self.intro_panel)
  self:add(self.feed_panel)
end

function IntroPage:_draw()
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


return IntroPage
