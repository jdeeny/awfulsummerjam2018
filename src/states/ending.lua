local State = require('src.states.state')
local StateEnding = class("StateEnding", State)

function StateEnding:initialize()
  States.State.initialize(self, 'Ending')
  self.input = baton.new(Config.Controls)
end

function StateEnding:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    new_game()
  end
end


function StateEnding:draw()
  love.graphics.setColor(Palette.Yellow)
  love.graphics.print("Ending", 5, 5)
end

return StateEnding
