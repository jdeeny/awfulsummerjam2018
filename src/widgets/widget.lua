local Widget = class('Widget')


-- Create a new Widget, at (x,y), w wide and h high. Coords are text coords
function Widget:initialize(x, y, w, h, bgcolor)
  self.clean = false
  self.contents = { }
  self.bgcolor = bgcolor or { 0, 0, 0, 0}
  self.cw, self.ch = w, h
  self.px, self.py = Screen.topixels(x or 1, y or 1)
  self.pw, self.ph = Screen.topixels(w or 1, h or 1)
  --self.pxoff, self.pyoff = Screen.topixels(xoff or 0, yoff or 0)

  self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  love.graphics.setCanvas()
end

function Widget:add(item)
  table.insert(self.contents, item)
end

function Widget:update(dt, x, y)

  _ = self._update_mouse and self:_update_mouse(x, y)
  for i,v in ipairs(self.contents) do
    v:update(dt, x, y)
  end

  if self.clean == false and self._draw then
    self:_draw()
    love.graphics.setCanvas()
    self.clean = true
  end
end

function Widget:_update_mouse(x, y)
  local inside =
    x >= self.px and x <= self.px + self.pw and
     y >= self.py and y <= self.py + self.ph

  local down = love.mouse.isDown(1)


--[[  if self.mouse_state == 'down' and outside then
  else

  end
  if inside and down then
    if love.mouse.isDown(1) then
      if self.mouse_state =
    end
    self.mouse_state =
  else
  end]]
end

function Widget:click(x, y)
  print("widget:click: ".. x .." "..y)
  --local x, y = x - self.px, y - self.py
  print(self.px.." "..self.py.." "..self.pw.." "..self.ph)
  if x < self.px or y < self.py or x > (self.pw + self.px) or y > (self.ph + self.py) then
    print("bail")
    return
  end
  print("try onclick")
  if self._onclick then
--    if x >=0 and y >=0 and x < self.pw and y < self.ph then
print("onclick..")
      self:_onclick(x, y)
  --  end
  else
    for i, v in ipairs(self.contents) do
      if v.click then
        v:click(x -self.px, y-self.py)
      else
        print("Try to click but no click: ")
        --print(pl.pretty.dump(v))
        --print('.')
      end
    end
  end
end


function Widget:draw()
  if self.hidden then
  else
    love.graphics.setColor(Palette.PureWhite)
    love.graphics.draw(self.canvas, self.px, self.py)
    for i,v in ipairs(self.contents) do
      v:draw()
    end
  end
end

return Widget
