local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

  self.main_window = require('src.ui.windows.gamewindow')
end


function StateGameplay:enter()
  Game.time:reset('GameStart')
  Game.time.scale = 1.0
  Game.news:add("Game Begins", 'important')
  Game.time.ticking = true
  self:_set_page("Status")
end

function StateGameplay:update(dt)
  State.update(self, dt)

  self.status_profit:set_value(Player:get_profit())
  if self.input:pressed('click') then
    local x, y = love.mouse.getPosition()
    print("click: "..x.." "..y)
    self.main_window:click(x, y)
  end


  self.status_date.txt = Game.time:emit()
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

function StateGameplay:add_scroll(y)
  print("Scroll: " .. y)
  self.main_window:add_scroll(y)
end

return StateGameplay
