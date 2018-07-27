local ScrollPanel = class('ScrollPanel', Panel)
function ScrollPanel:initialize(x, y, w, h, xoff, yoff)
  Panel.initialize(self, x, y, w, h, xoff, yoff)
end

return Panel
