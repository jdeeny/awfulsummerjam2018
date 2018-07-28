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

function StateIntro:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    Game.state:jump('Gameplay')
    Game.state:call('Debounce')
  end

  self.a_window:update(dt)
end

function StateIntro:draw()
  love.graphics.setColor(Palette.AquaBlue)
  love.graphics.print("Intro", 5, 5)

  self.a_window:draw()
end


return StateIntro
