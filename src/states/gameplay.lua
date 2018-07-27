local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(2, 2, 120, 45, Palette.Yellow)


end

function StateGameplay:update(dt)
  State.update(self, dt)
  self.main_window:update(dt)

  if self.input:pressed('continue') then
    Game.state:jump('Ending')
    Game.state:call('Debounce')
  end
end


function StateGameplay:draw()
  Palette.Wine:set()
  love.graphics.print("Gameplay", 5, 5)
  self.main_window:draw()
end

return StateGameplay
