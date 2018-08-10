local Panel = require('src.ui.widgets.base.panel')

local Canvas = class('Canvas', Panel)

function Canvas:initialize()
  Panel.initialize(self)
end

function Canvas:add(item, x, y)
end

return Canvas
