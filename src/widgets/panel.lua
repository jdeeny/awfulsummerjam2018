local Panel = class('Panel', Widget)
function Panel:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)
end

return Panel
