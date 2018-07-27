local List = class('List', Widget)
function List:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)
end

return List
