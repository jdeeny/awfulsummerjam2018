local Panel = class('Panel', Widget)
function Panel:initialize(x, y, w, h, xoff, yoff)
  Widget.initialize(self, x, y, w, h, xoff, yoff)
end

return Panel
