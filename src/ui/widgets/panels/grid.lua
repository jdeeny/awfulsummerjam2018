local Panel = require('src.ui.widgets.base.panel')

local Grid = class('Grid', Panel)

function Grid:initialize()
  Panel.initialize(self)
end

return Grid
