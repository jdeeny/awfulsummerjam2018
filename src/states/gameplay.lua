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
    Widgets.Button:new(17, 1, 15, 5, 2, 2, "Button 2"),
    Widgets.Button:new(33, 1, 15, 5, 2, 2, "Button 3"),
    Widgets.Button:new(49, 1, 15, 5, 2, 2, "Button 4"),
    Widgets.Button:new(65, 1, 15, 5, 2, 2, "Button 5"),
  }
  for _,v in ipairs(buttons) do
    self.main_window:add(v)
  end

  --local calendar = Widgets.CalendarPanel:new(130,1, 28, 43, 2, 2)
  --self.main_window:add(calendar)
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
