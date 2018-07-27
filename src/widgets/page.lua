local Page = class('Page', Widget)
function Page:initialize(x, y, w, h, xoff, yoff, title, color, altcolor)
  Widget.initialize(self, x, y, w, h, xoff, yoff)
  self.title = title or "A Page"
  self.color = color or {0, 255, 255, 255 }
  self.altcolor = altcolor or { 128, 0, 0, 255 }
end

function Page:draw_widget(xoff, yoff)
  print("!!")
  local x = self.px + xoff
  local y = self.py + yoff
  love.graphics.draw(self.canvas, x, y)
  for i,v in ipairs(self.contents) do
    v:draw_widget(x, y)
  end
  Widget.draw_widget(self, xoff, yoff)
end

return Page
