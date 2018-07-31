local IntroPage = class('IntroPage', Widget)

local row1 = 4
local row2 = 18
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3

local INTRO = [[
You are a movie executive.

    Make many sequals!

You have been given 2 years to make a profit. It you do good you win.
]]

function IntroPage:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)

  self.rankings_panel = Widgets.Panel:new(col1,row1,colw,16, "BOX OFFICE")
  self.bo_panel = Widgets.BoxOfficePanel:new(col1+1, row1+4, colw-4, 16)
  self.rankings_panel:add(self.bo_panel)
  self.intro_panel = Widgets.Panel:new(col1,row2,colw, 25, "INTRODUCTION")
  self.intro_panel:add(Widgets.TextPanel:new(col1+3,row2+3, colw-6, 24,Palette.NormalText, INTRO))
  self.feed_panel = Widgets.Panel:new(col2,row1,colw,self.ch - 5, "NEWS FEED")
  self.feed_panel:add(Widgets.NewsFeed:new(col2+2,row1+3,self.feed_panel.cw-4,self.feed_panel.ch-4))
  --self.finance_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  local function go_gameplay ()
    print('clicked go')
    if not Game.time.is_historic() then
      Game.state:jump('Gameplay')
      Game.state:call('Debounce')
    end
  end

  self.continue_button = Widgets.Button:new(10,row2+15,colw-10,7,"Generating History...",
    {
      onclick=go_gameplay,
    } )

  self.intro_panel:add(self.continue_button)
  self:add(self.rankings_panel)
  self:add(self.intro_panel)
  self:add(self.feed_panel)
end

function IntroPage:update(dt,x,y)
Widget.update(self,dt,x,y)
if not Game.time:is_historic() then
  self.continue_button.text = "Begin Game"
  self.continue_button.clean = false
end

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
