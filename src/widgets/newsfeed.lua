local NewsFeed = class('NewsFeed', Widget)

function NewsFeed:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)
  self.last_count = 0
end

function NewsFeed:update(dt, x, y)
  Widget.update(self, dt, x, y)
  if Game.news.count > self.last_count then
    self.clean = false
    --print("News update")
  end
end

function NewsFeed:_draw()
  local drawy = self.ch -5
  local count = 1
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  --print("draw-feed")

  repeat
    local txt,c = Game.news:emit(count)
    if txt then
      local x, y = Screen.topixels(1,drawy)
      local r,g,b = c[1], c[2], c[3]
      love.graphics.setColor(r,g,b,0xFF)
      love.graphics.printf(txt,x,y, self.pw-8*4)
      if feed_item == self.last_count then
        love.graphics.setColor(Palette.Grey)
        Screen.print(string.rep('-',self.cw-4), 2,drawy-1)
        drawy = drawy - 1
      end
      count = count + 1
    drawy = drawy - 5
    end

  until drawy < -3 or not txt

  self.last_count = Game.news.count
end

return NewsFeed
