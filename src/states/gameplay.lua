local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)
end

function StateGameplay:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    Game.state:jump('Ending')
    Game.state:call('Debounce')
  end
end


function StateGameplay:draw()
  Palette.Wine:set()
  love.graphics.print("Gameplay", 5, 5)
end

return StateGameplay
