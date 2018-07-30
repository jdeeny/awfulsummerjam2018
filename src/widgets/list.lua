local List = class('List', Widget)
function List:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)

  self.items = {}

end

function List:add_list(items)
  print("list add_list")
  for i,v in ipairs(items) do
    self:add(v)
  end
  self.clean = false
end

function List:add(item)
  if item then
    print("add item: " .. item:emit())-- .. pl.pretty.dump(item))
    table.insert(self.items,item)
    self.clean = false
  end
end

return List
