local State = require('src.states.state')
local StateIntro = class("StateIntro", State)

function StateIntro:initialize()
  States.State.initialize(self, 'Intro')
  self.input = baton.new(Config.Controls)

  self.a_window = Window:new(21, 1, 80, 45)
--  self.a_window:add(Widgets.Slider:new(50, 100, 10, 30), 0, 0)
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
