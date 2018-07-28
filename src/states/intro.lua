local State = require('src.states.state')
local StateIntro = class("StateIntro", State)

local INTRO = [[
You are a movie executive.

    Make many sequals!

You have been given 2 years to make a profit. It you do good you win.
]]

function StateIntro:initialize()
  States.State.initialize(self, 'Intro')
  self.input = baton.new(Config.Controls)

  self.a_window = Window:new(21, 1, 80, 45)
  self.a_window:add(Widgets.TextPanel:new(1, 1, 80, 6, Palette.Yellow, INTRO, {center=true}))

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

  self.a_window:update(dt)
  if Game.time.scale > 100.0 and not Game.time:is_historic() then
    Game.time.ticking = false
  end
end

function StateIntro:draw()
  love.graphics.setColor(Palette.AquaBlue)
  love.graphics.print("Intro", 5, 5)

  self.a_window:draw()
end


return StateIntro
