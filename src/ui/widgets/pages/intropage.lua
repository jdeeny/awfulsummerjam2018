
local IntroPage = class('IntroPage', Widget)

--[[local row1 = 4
local row2 = 20
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3
]]

local INTRO = [[
Welcome to Aperiology Pictures. Our studio usually drafts other films
and makes unofficial sequels. It's your job to guage public option and
make some pictures, but most importantly, Make Us Money!

You have been given 2 years to make a profit, use your time wisely.
]]

function IntroPage:initialize(w, h)
  Widget.initialize(self, w, h)

  --self.rankings_panel = Widgets.Panel:new({title="BOX OFFICE"})
  --self.bo_panel = Widgets.BoxOfficePanel:new()
  --self.rankings_panel:add(self.bo_panel)
  --self.intro_panel = Widgets.Panel:new({title="INTRODUCTION"})
  --self.intro_panel:add(Widgets.TextPanel:new({text=INTRO}))
  --self.feed_panel = Widgets.Panel:new({title="NEWS FEED"})
  --self.feed_panel:add(Widgets.NewsFeed:new())--self.feed_panel.cw-4,self.feed_panel.ch-3))
  --self.finance_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  local function go_gameplay ()
    print('clicked go')
    if not Game.time:is_historic() then
      Game.state:jump('Gameplay')
      Game.state:call('Debounce')
    end
  end

  local function music_off ()
    Game.audiomanager.currentmusic = 'off'
    Game.audiomanager:new_music()
  end
  local function music_a()
    Game.audiomanager.currentmusic = 'a'
    Game.audiomanager:new_music()--{fade=true})
  end
  local function music_b()
    Game.audiomanager.currentmusic = 'b'
    Game.audiomanager:new_music()--{fade=true})
  end
  local function music_c()
    Game.audiomanager.currentmusic = 'c'
    Game.audiomanager:new_music()--{fade=true})
  end
  self.continue_button = Widgets.Button:new("Generating History...",
    {
      onclick=go_gameplay,
    } )

  self.music_off_button = Widgets.Button:new("Music Off",
    {
      onclick=music_off,
    } )
  self.music_a_button = Widgets.Button:new("Music A",
    {
      onclick=music_a,
    } )
  self.music_b_button = Widgets.Button:new("Music B",
    {
      onclick=music_b,
    } )
    self.music_c_button = Widgets.Button:new("Music C",
      {
        onclick=music_c,
      } )


  self:add(self.continue_button)
  self:add(self.music_off_button)
  self:add(self.music_a_button)
  self:add(self.music_b_button)
  self:add(self.music_c_button)
  self:add(self.rankings_panel)
  self:add(self.intro_panel)
  self:add(self.feed_panel)
end

function IntroPage:update(dt,x,y)
  Widget.update(self,dt,x,y)
  if not Game.time:is_historic() then
    self.continue_button.text = "Begin Game"
    self.continue_button.clean = false
  else
    local days = (Config.StartYear - Config.GameYear) * Config.DaysPerMonth * Config.MonthsPerYear
    local s = "Generating History... ("..string.format("%2d",math.min(99.9,100.0 - Game.time:indays() * 100.0 / days)).."%)"
    if self.continue_button.text ~= s then
      self.continue_button.clean = false
      self.continue_button.text = s
    end
  end
end

function IntroPage:_draw()
  love.graphics.setCanvas(self.canvas)

  love.graphics.clear(Palette.Background)
  love.graphics.setColor(Palette.Frame)

  Line.drawh(1,1,self.cw, '╔', '═', '╗')
  Line.drawh(1,self.ch-2,self.cw, '╠', '═', '╣')
  Line.drawh(1,self.ch,self.cw, '╚', '═', '╝')
  self:print(1,self.ch-1, '║')
  self:print(self.cw,self.ch-1, '║')
  Line.drawv(1,2, self.ch-4, '║')
  Line.drawv(self.cw,2, self.ch-4,'║')
end


return IntroPage
