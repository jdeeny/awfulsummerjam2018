local Color = class('Color')

function Color:initialize(r, g, b, a)
  self.r = (r or 0x80)--/255.0
  self.g = (g or 0x80)--/255.0
  self.b = (b or 0x80)--/255.0
  self.a = (a or 0xFF)--/255.0
end

function Color:get_color()
  return { self.r, self.g, self.b, self.a }
end

function Color:set()
  love.graphics.setColor(self.r, self.g, self.b, self.a)
end

return Color
