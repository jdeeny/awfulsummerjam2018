local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(2, 2, 120, 45, Palette.Yellow)
  self:_build()

end

function StateGameplay:_build()
  local buttons = {
    Widgets.Button:new(1, 1, 15, 5, 2, 2, "Projects"),
    Widgets.Button:new(16, 1, 15, 5, 2, 2, "Button 2"),
  }
  for _,v in ipairs(buttons) do
    self.main_window:add(v)
  end
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
  love.graphics.setColor(Palette.Wine)
  love.graphics.print("Gameplay", 0, 0)
  self.main_window:draw()
end

return StateGameplay
