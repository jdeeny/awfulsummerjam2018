local ScrollPanel = class('ScrollPanel', Widget)

local UP = "▲"
local DOWN = "▼"

function ScrollPanel:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)
end

return ScrollPanel
