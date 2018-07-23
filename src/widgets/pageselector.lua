local PageSelector = class('PageSelector', Widget)
function PageSelector:initialize(x, y, w, h, bgcolor)
  Widget.initialize(self, x, y, w, h, bgcolor)
end

return PageSelector
