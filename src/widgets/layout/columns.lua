local Columns = class('Columns', Widget)

function Columns:initialize(w, h, n)
  Widget.initialize(self, w, h)
  self.columns = n or 2
  self.colsplit = 2
  self.colw = math.floor(w / n) - colsplit
  for i=1,self.columns do
    self.contents[i] = {}
  end
end

function Columns:add(item, x, y, col)
  local x, y = x or 1, y, 1
  local col = col or 1
  table.insert(self.contents[col], item)
end

--function Columns:update(dt, x, y)
--  Widget.update(self, x, y)
--end

--function Columns:_draw()
  --love.graphics.setCanvas(self.canvas)
  --Widget.update(self, x, y)
--end

return Columns
