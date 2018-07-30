local State = require('src.states.state')
local StateIntro = class("StateIntro", State)


function StateIntro:initialize()
  States.State.initialize(self, 'Intro')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(1,1,Config.CharWidth,Config.CharHeight)
  self.main_window:add(Widgets.TextPanel:new(3, 5, 80, 6, Palette.Yellow, INTRO, {center=true}))

  self.heading = Widgets.TextPanel:new(Config.CharWidth - 21, 1, 20, 1, Palette.HighlightText, "Aperiology")
  self.main_window:add(self.heading)

  local bwidth = 20
  local bheight = 3
  local buttons = {
    Widgets.Button:new(1, 1, bwidth, bheight, "Status"),--, {onclick = function() self:swap_to_status() end }),
    Widgets.Button:new(1+bwidth, 1, bwidth, bheight, "Projects"),--, {onclick = function() self:swap_to_projects() end }),
    Widgets.Button:new(1+2*bwidth, 1, bwidth, bheight, "Surveys"),--,{onclick = function() self:swap_to_surveys() end }),
    Widgets.Button:new(1+3*bwidth, 1, bwidth, bheight, "Person DB"),--,{onclick = function() self:swap_to_persondb() end }),
    Widgets.Button:new(1+4*bwidth, 1, bwidth, bheight, "Film DB"),--,{onclick = function() self:swap_to_moviedb() end }),
  }
  for _,v in ipairs(buttons) do
    self.main_window:add(v)
  end

  self.pages = {}
  self.pages['Intro'] = Widgets.IntroPage:new(1, Config.PageY, Config.PageWidth, Config.PageHeight)

  for _,v in pairs(self.pages) do
    self.main_window:add(v)
  end
  --self:_set_page('Status')

  self.status_profit = Widgets.MoneyInfo:new(3, Config.CharHeight - 2, 20, Game.player:get_profit() )
  self.main_window:add(self.status_profit)

  self.status_date = Widgets.TextPanel:new(Config.CharWidth - 14, Config.CharHeight - 2, 20, 1, Palette.HighlightText, Game.time:emit())
  self.main_window:add(self.status_date)



end

function StateIntro:enter()
  Game.time:reset()
  Game.time.scale = Config.HistorySpeedup
  Game.time.ticking = true
  print("Money: " .. Text.dollars(14354848.234544))
  print("Money: " .. Text.dollars(-54848.234544))
  print("Money: " .. Text.dollars(148.234544))
  print("Money: " .. Text.dollars(1.99994544))
end


function StateIntro:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    Game.state:jump('Gameplay')
    Game.state:call('Debounce')
  end

  self.main_window:update(dt)
  if Game.time.scale > 100.0 and not Game.time:is_historic() then
    Game.time.ticking = false
  end
end

function StateIntro:draw()
  love.graphics.setColor(Palette.AquaBlue)
  --love.graphics.print("Intro", 5, 5)

  self.main_window:draw()
end


return StateIntro
