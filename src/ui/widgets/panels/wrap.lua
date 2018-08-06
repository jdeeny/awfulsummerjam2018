local Panel = require('src.widgets.base.panel')

local Wrap = class('Wrap', Panel)

function Wrap:initialize()
  Panel.initialize(self)
end

return Wrap
