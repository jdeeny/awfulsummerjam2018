local Panel = class('Panel', Widget)
function Panel:initialize(x, y, w, h, bgcolor)
  Widget.initialize(self, x, y, w, h, bgcolor)
end

return Panel
