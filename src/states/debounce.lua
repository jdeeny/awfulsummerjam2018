local State = require('src.states.state')
local StateDebounce = class("StateDebounce", State)

local DEBOUNCE_TIME = 0.08

function StateDebounce:initialize()
  States.State.initialize(self, 'Debounce')
  self.input = baton.new(Config.Controls)
  self.timeout = DEBOUNCE_TIME
end

function StateDebounce:update(dt)
  State.update(self, dt)

  if self.input:down('anykey') then
    self.timeout = DEBOUNCE_TIME
  else
    self.timeout = self.timeout - dt
    if self.timeout < 0.0 then
      Game.state:ret()
    end
  end
end

function StateDebounce:draw()
  Palette.Green:set()
  love.graphics.print("Debounce", 0, 0)
end


return StateDebounce
