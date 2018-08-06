local ScrollPanel = class('ScrollPanel', Widget)

local UP = "▲"
local DOWN = "▼"

function ScrollPanel:initialize(w, h)
  Widget.initialize(self, w, h)
end

return ScrollPanel
