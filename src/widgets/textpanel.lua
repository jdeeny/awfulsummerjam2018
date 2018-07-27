local TextPanel = class('TextPanel', Widget)

local function center_text(text, w, h)
  local text = text or " "
  local new_text = ""
  local w, h = w or 1, h or 1
  local lines = 0
  --print(text)


  for line in text:gmatch('[^\r\n]+') do
    lines = lines + 1
    local left = (w - #line) / 2
    new_text = new_text .. string.rep(' ', left) .. line .. '\n'
    --print(new_text)
  end
  local top = (h - lines) / 2
  new_text = string.rep('\n', top) .. new_text
  return new_text
end

function TextPanel:initialize(x, y, w, h, color, txt, options)
  Widget.initialize(self, x, y, w, h)

  self.options = options or {}
  self.bgcolor = bgcolor or Palette.Black
  self.color = color or Palette.White
  self.w = w or 1
  self.h = h or 1

  self.clean = false
  self.txt = txt or "TEXT"
  if self.options.center == true then
    self.txt = center_text(self.txt, self.w, self.h)
  end
  self.old_txt = self.txt
end



function TextPanel:update(dt, x, y)
  Widget.update(self, dt, x, y)
  if self.txt ~= self.old_txt then
    self.clean = false
  end

  if not self.clean then
    self.old_txt = txt
    self:_draw()
    self.clean = true
  end
end

function TextPanel:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(self.bgcolor)
  love.graphics.setColor(self.color)
  love.graphics.setFont(Text.ibmfont)
  love.graphics.print(self.txt, 0, 0)
  love.graphics.setCanvas()
end

return TextPanel
