local List = class('List', Widget)
function List:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)

  self.items = {}

end

function List:add_list(items)
  for i,v in ipairs(items) do
    print("Item to add: " .. pl.pretty.dump(v))
  end
  self.clean = false
end

return List
