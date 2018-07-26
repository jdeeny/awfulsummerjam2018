local State = require('src.states.state')
local StateMenu = class("StateMenu", State)

function StateMenu:initialize()
  States.State.initialize(self, 'Menu')
  self.input = baton.new(Config.Controls)
end

return StateMenu
