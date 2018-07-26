local State = require('src.states.state')
local StateIntro = class("StateIntro", State)

function StateIntro:initialize()
  States.State.initialize(self, 'Intro')
  self.input = baton.new {
    controls = {
        continue = {'key:space', 'key:return', 'key:escape'},
        },
  }
end

function StateIntro:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    Game.state:jump('Gameplay')
    Game.state:call('Debounce')
  end
end

function StateIntro:draw()
  Palette.AquaBlue:set()
  love.graphics.print("Intro", 5, 5)
end


return StateIntro
