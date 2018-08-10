local Panel = require('src.ui.widgets.base.panel')

local Wrap = class('Wrap', Panel)

function Wrap:initialize()
  Panel.initialize(self)
end

return Wrap
