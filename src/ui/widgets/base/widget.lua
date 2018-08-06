local Widget = class('Widget')

Widget.static.Defaults = {
  margin = { left = 1, right = 1, top = 1, bottom = 1 },
  padding = { left = 1, right = 1, top = 1, bottom = 1 },
}


function Widget:initialize(options)
  self.clean = false

  self.options = pl.tablex.deepcopy(Widget.Defaults)

  if self.options then
    for k,v in pairs(self.options) do
      self.options[k] = pl.tablex.deepcopy(v)
    end
  end


  --self.pw, self.ph = Screen.to_px_span(w or 1, h or 1)

  --self.canvas = love.graphics.newCanvas(self.pw, self.ph)
  --love.graphics.setCanvas(self.canvas)
  --love.graphics.clear(self.bgcolor)
  --love.graphics.setCanvas()
end


function Widget:_measure()
  local w = self.options.padding.left + self.options.padding.right +
            self.options.margin.left + self.options.padding.right +
            (self.w or 0)

  local h = self.options.padding.top + self.options.padding.bottom +
            self.options.margin.top + self.options.margin.bottom +
            (self.h or 0)

  self.desired_size = { w, h }
  return { w, h }
end

function Widget:_arrange()
end


function Widget:add(item)
  --table.insert(self.contents, item)
end

function Widget:draw_frame(kind)
  --love.graphics.setCanvas(self.canvas)
  --love.graphics.setColor(Palette.frame)
  --Line.drawh(1, 1, self.cw, kind)
  --Line.drawv(1, 1, self.ch, kind)
  --Line.drawv(self.cw, 1, self.ch, kind)
  --Line.drawh(1, self.ch, self.cw, kind)
end

function Widget:update(dt, x, y)
--[[
  _ = self._update_mouse and self:_update_mouse(x, y)
  for i,v in ipairs(self.contents) do
    v:update(dt, x, y)
  end

  if self.clean == false and self._draw then
    self:_draw()
    love.graphics.setCanvas()
    self.clean = true
  end
  ]]
end

function Widget:_onscroll(y)
  for i,v in ipairs(self.contents) do
    if v._onscroll then v:_onscroll(y) end
  end
end

function Widget:_update_mouse(x, y)
  local inside =
    x >= 0 and x <= self.pw and
     y >= 0 and y <= self.ph

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
  --print("widget:click: ".. x .." "..y)
  --local x, y = x - self.px, y - self.py
  --print(self.px.." "..self.py.." "..self.pw.." "..self.ph)
  if x <= 0 or y <= 0 or x > self.pw or y > self.ph then
    return
  end
  if self._onclick then
--    if x >=0 and y >=0 and x < self.pw and y < self.ph then
      self:_onclick(x, y)
  --  end
  else
    for i, v in ipairs(self.contents) do
      if v.click then
        v:click(x,y)-- -self.px, y-self.py)
      else
        --print(pl.pretty.dump(v))
        --print('.')
      end
    end
  end
end

function Widget:print(cx, cy, text, color)
  --local oldcolor
  --if color then
  --  love.graphics.setColor(color)
  --end
  --local x,y = Screen.to_px_loc(x-1,y-1)
  --love.graphics.print(text, x, y)
end

function Widget:draw()
  --[[if self.hidden then
  else
    love.graphics.setColor(Palette.PureWhite)
    love.graphics.draw(self.canvas, self.px, self.py)
    for i,v in ipairs(self.contents) do
      v:draw()
    end
  end]]
end

return Widget
