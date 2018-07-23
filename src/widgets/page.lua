local Page = class('Page', Widget)
function Page:initialize(x, y, w, h, bgcolor)
  Widget.initialize(self, x, y, w, h, bgcolor)
end
return Page
