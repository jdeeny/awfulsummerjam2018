local StateSplash = class("Splash", State)
local Super = State

function StateSplash:initialize()
  Super.initialize(self, 'Splash')
  self.input = baton.new {
    controls = {
      left = {'key:left', 'key:a', 'axis:leftx-', 'button:dpleft'},
      right = {'key:right', 'key:d', 'axis:leftx+', 'button:dpright'},
      up = {'key:up', 'key:w', 'axis:lefty-', 'button:dpup'},
      down = {'key:down', 'key:s', 'axis:lefty+', 'button:dpdown'},
      action = {'key:x', 'button:a'},
    },
    pairs = {
      move = {'left', 'right', 'up', 'down'}
    },
    joystick = love.joystick.getJoysticks()[1],
  }

end


function StateSplash:update(dt)
  Super.update(self, dt)
  if self.input:pressed('left') then print('L') end
end

return StateSplash