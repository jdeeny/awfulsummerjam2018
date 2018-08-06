local State = require('src.states.state')
local StateIntro = class("StateIntro", State)


function StateIntro:initialize()
  States.State.initialize(self, 'Intro')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(1,1,Config.CharWidth,Config.CharHeight)
  --self.main_window:add(Widgets.TextPanel:new(80, 6, Palette.Yellow, INTRO, {center=true}))

  --self.heading = Widgets.TextPanel:new(20, 1, Palette.HighlightText, "Aperiology")
  --self.main_window:add(self.heading)
--[[
  local bwidth = 20
  local bheight = 4
  local buttons = {
    Widgets.Button:new("Status"),--, {onclick = function() self:swap_to_status() end }),
    Widgets.Button:new("Projects"),--, {onclick = function() self:swap_to_projects() end }),
    Widgets.Button:new("Surveys"),--,{onclick = function() self:swap_to_surveys() end }),
    Widgets.Button:new("Person DB"),--,{onclick = function() self:swap_to_persondb() end }),
    Widgets.Button:new("Film DB"),--,{onclick = function() self:swap_to_moviedb() end }),
  }
  for _,v in ipairs(buttons) do
    self.main_window:add(v)
  end

  self.pages = {}
  self.pages['Intro'] = Widgets.IntroPage:new()--Config.PageWidth, Config.PageHeight)

  for _,v in pairs(self.pages) do
    self.main_window:add(v)
  end
  --self:_set_page('Status')

  self.status_profit = Widgets.MoneyInfo:new(20, Game.player:get_profit() )
  self.main_window:add(self.status_profit)

  self.status_date = Widgets.TextPanel:new(20, 1, Palette.HighlightText, Game.time:emit())
  self.main_window:add(self.status_date)

]]

end

function StateIntro:enter()
  Game.time:reset()
  Game.time.scale = Config.HistorySpeedup
  Game.time.ticking = true
end


function StateIntro:update(dt)
  State.update(self, dt)

  if self.input:down('quit') then
    print("QUIT")
    love.event.push('quit')
  end
  if self.input:pressed('continue') and not Game.time:is_historic() then
    Game.state:jump('Gameplay')
    Game.state:call('Debounce')
  end

  if self.input:pressed('click') then
    local x, y = love.mouse.getPosition()
    print("click: "..x.." "..y)
    self.main_window:click(x, y)
  end

  self.main_window:update(dt)
  if Game.time.scale > 100.0 and not Game.time:is_historic() then
    Game.time.ticking = false
    Game.time:reset('GameStart')
  end
end

function StateIntro:draw()
  love.graphics.setColor(Palette.AquaBlue)
  --love.graphics.print("Intro", 5, 5)

  self.main_window:draw()
end


return StateIntro
