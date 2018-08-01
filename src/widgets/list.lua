local List = class('List', Widget)
function List:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)

  self.items = {}
  self.item_height = 4
  self.current_top = 1
  self.highlighted = 0

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

function List:_onscroll(scroll_amount)
  print("list onscroll" .. scroll_amount)
  self.current_top = math.max(1, math.min(#self.items-math.ceil(self.ch/self.item_height), self.current_top - scroll_amount))
  self.clean = false
end

function List:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Background)
  for i=self.current_top,self.current_top + math.ceil(self.ch / self.item_height) do
    if self.items[i] then
      love.graphics.setColor(i == self.highlighted and Palette.HighlightText or Palette.NormalText)
      self.items[i]:list_print(self.cx, self.cy + (i-1-self.current_top) * self.item_height, self.cw)
    end
  end
end
function List:click(x,y)
  if self._onclick then self:_onclick(x,y) end
end

function List:_onclick(x, y)
  print("click in List")
  local x, y = x - self.px, y - self.py
  if x >= 0 and y >= 0 and x <= self.pw and y <= self.ph then
    local h = math.floor((y-16) /16/ self.item_height)
    if h < self.ch and self.items[self.current_top+h] then
      self.highlighted = self.current_top+h
      self.clean = false
      self:_show_details(self.current_top+h)
    end
    --[[if type(self.options.onclick) == 'function' then
      print("click")
      self.options.onclick()
    end]]
  else
    --print("Click outside List: " .. self.text .." ".. x.. " " .. y)
  end
  self.mode = 'click'
end

function List:_show_details(n)
print ("Show deets")
end

return List
