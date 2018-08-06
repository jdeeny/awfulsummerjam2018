local State = require('src.states.state')
local StateEnding = class("StateEnding", State)

local ENDING = [[
  It is the end of movies,
and thus the end of sequels.

          The End
]]

function StateEnding:initialize()
  States.State.initialize(self, 'Ending')
  self.input = baton.new(Config.Controls)

  self.a_window = Window:new(21, 1, 80, 45)
  self.a_window:add(Widgets.TextPanel:new(80, 6, Palette.Yellow, ENDING, {center=true}))

end

function StateEnding:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    end_game()
    new_game()--Game.state:jump('Splash')
    Game.state:call('Debounce')
  end

  self.a_window:update(dt)
end

function StateEnding:draw()
  love.graphics.setColor(Palette.AquaBlue)
  love.graphics.print("Ending", 5, 5)

  self.a_window:draw()
end


return StateEnding
