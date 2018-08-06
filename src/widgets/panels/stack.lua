local Panel = require('src.widgets.base.panel')

local Stack = class('Stack', Panel)

function Stack:initialize()
  Panel.initialize(self)
end

return Stack
