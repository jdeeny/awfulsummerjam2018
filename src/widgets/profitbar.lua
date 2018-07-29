local ProfitBar = class('ProfitBar', Widget)

local gradient = { '░', '▒', '▓', }

local c_pos = Palette.Green
local c_neg = Palette.Red
local c_neut = Palette.Grey

function ProfitBar:initialize(x, y, w, data, options)
  self.options = options or {}
  Widget.initialize(self, x, y, w, self.options.height or 1)
  self.data = data or {}
end

--[[function ProfitBar:update(dt, x, y)
  Widget.update(self, dt, x, y)

  if self.old_mode ~= self.mode then self.clean = false end
  self.old_mode = self.mode
end]]

function ProfitBar.set_data(data)
  self.data = data or {}
  self.clean = false
end

function ProfitBar:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Background)

  local dwidth = #self.data
  local remainder = self.cw - dwidth
  for x=1,self.cw do
    for y=1,self.ch do
      if x < remainder then
        love.graphics.setColor(grey)
        self:print(x, y, gradient[1])
      else
        local d = self.data[x-remainder]
        love.graphics.setColor((d > 0 and green) or red)
        self:print(x, y, gradient[math.max(math.min(#gradient, d*#gradient), 1)])
      end
    end
  end
end

return ProfitBar
