--[[
  `Windows` are the basic drawing space for the ui engine. It is like a panel,
  it holds items. Each window has it's own layout system/thread and will update
  independently.
]]

local Window = class('Window')


-- Create a new Window, at (x,y), w wide and h high. Coords are text coords
function Window:initialize(loc, size)
  self.contents = { }

  self.measure_queue = {}
  self.arrange_queue = {}
  print("loc")
  self.loc =  Loc:new('ch', 1, 1)
  print("size")
  self.size =  Dist:new('ch', Config.CharWidth, Config.CharHeight)
  print(pl.pretty.dump(self.size))
  self:update_dims()

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.setColor(Palette.PureWhite)
  love.graphics.clear(Palette.Violet)
  --[[lines.draw_vert(0, 0, self.ch-2)
  lines.draw_vert(self.cw-1, 0, self.ch-2)
  lines.draw_horiz(self.ch-1, 1, self.cw-2)
  lines.draw_ll(0, self.ch-1)
  lines.draw_lr(self.cw-1, self.ch-1)]]
  love.graphics.setCanvas()
  --self:rollup()
end

function Window:update_dims()
  self.cw, self.ch = self.size:as('ch')
  self.pw, self.ph = self.size:as('px')
  self.cx, self.cy = self.loc:as('ch')
  self.px, self.py = self.loc:as('px')

  print("cw: "..self.cw.." "..self.ch)
  print("pw: "..self.pw.." "..self.ph)
  print("cx: "..self.cx.." "..self.cx)
  print("px: "..self.px.." "..self.px)

end

function Window:update(dt)
  local x, y = love.mouse.getPosition()

  x, y = x - (self.px or 0), y - (self.py or 0)

  for i, v in ipairs(self.contents) do
    if v.update then
      v:update(dt, x, y)
    else
      print("Couldn't update in window:")
      print(pl.pretty.dump(v))
      print(".")
    end
  end
end

--[[function Window:rollup()
  local target = 0 - self.ph
  flux.to(self, self.rolluptime, { py = target } ):ease('quadin'):oncomplete(function() self:rolldown() end )
end

function Window:rolldown()
  flux.to(self, self.rolldowntime, { py = 0 } ):ease('elasticout')--:oncomplete(self:rollup())
end]]

function Window:add_scroll(y)
  for i, v in ipairs(self.contents) do
    if v._onscroll then v:_onscroll(y) end
  end
end

function Window:click(x, y)
  local x, y = x - self.px, y - self.py
  if x > self.pw or y > self.ph then
    print("click outside window")
    return
  end
  if self._onclick then
    print("onclick window: "..x.." "..y)
    self:_onclick(x, y)
  else
    print("onclick widgets")
    for i, v in ipairs(self.contents) do
      if v.click then
        v:click(x, y)
      else
        print("no click")
        --print("Try to click but no click from window: " ..(v.id or "") .. (v.text or "") .. (v.name or ""))
        --print(pl.pretty.dump(v))
        --print('.')
      end
    end
  end
end

function Window:add(item)
  table.insert(self.contents, item)
  --print("Add ")
end

function Window:draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Violet)
  for i, v in ipairs(self.contents) do
    if v.draw then
      v:draw()--self.px, self.py)
    else
      print("Try to draw from window but no draw func: ")
      print(pl.pretty.dump(v))
      print(".")
    end
  end
  love.graphics.setCanvas()
  love.graphics.setColor(Palette.PureWhite)
  love.graphics.draw(self.canvas, self.px, self.py)
end

-- Add a constraint to the solver
function Window:constrain(a, oper, b)
  print("Constrain: ".. a ..' ' .. oper .. ' ' .. b)
end

return Window
