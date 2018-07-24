local Page = class('Page', Widget)
function Page:initialize(x, y, w, h, bgcolor, title, color, altcolor)
  Widget.initialize(self, x, y, w, h, bgcolor)
  self.title = title or "A Page"
  self.color = color or {0, 255, 255, 255 }
  self.altcolor = altcolor or { 128, 0, 0, 255 }
end

function Widget:draw_widget(xoff, yoff)
  local x = self.px + xoff
  local y = self.py + yoff
  love.graphics.draw(self.canvas, x, y)
  for i,v in ipairs(self.contents) do
    v:draw_widget(x, y)
  end
end

return Page
