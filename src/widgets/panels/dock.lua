local Panel = require('src.widgets.base.panel')

local Dock = class('Dock', Panel)

function Dock:initialize()
  Panel.initialize(self)
end

return Dock
