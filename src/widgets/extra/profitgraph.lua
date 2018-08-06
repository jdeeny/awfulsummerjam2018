local ProfitGraph = class('ProfitGraph', Widget)

local gradient = { '░', '▒', '▓', }

local c_pos = Palette.Green
local c_neg = Palette.Red
local c_neut = Palette.Grey

function ProfitGraph:initialize(w, data, options)
  self.options = options or {}
  Widget.initialize(self, w, self.options.height or 1)
  self.data = data or {}
  self.old_day = 0
end

function ProfitGraph:update(dt, x, y)
  Widget.update(self, dt, x, y)

  local days = Game.time:indays()
  if days ~= self.old_day then
    self.clean = false
    self.old_day = days
  end
end

function ProfitGraph:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Background)


  -- print gain/loss/net
  self:print(2, self.ch + 1, "GAIN", Palette.Frame)
  self:print(2, self.ch + 1, "LOSS", Palette.Frame)
  self:print(2, self.ch + 1, " NET", Palette.Frame)

  v = Game.day_gross[1]
  local c = (v > 0 and Palette.MoneyGood) or (v <0 and Palette.MoneyBad) or Palette.MoneyNeutral
  self:print(self.cw - 15, self.ch + 1, v, c)
  v = Game.day_loss[1]
  local c = (v > 0 and Palette.MoneyGood) or (v <0 and Palette.MoneyBad) or Palette.MoneyNeutral
  self:print(self.cw - 15, self.ch + 2, v, c)
  v = Game.day_net[1]
  local c = (v > 0 and Palette.MoneyGood) or (v <0 and Palette.MoneyBad) or Palette.MoneyNeutral
  self:print(self.cw - 15, self.ch + 3, v, c)


  --print days
  self:print(self.cw - 15, self.ch + 1, Game.time:daysremaining() .. " days remaining", Palette.HighlightText)

  --draw graph
  for x=1,self.cw do
    self:print(x,3,'#')
  end


end
return ProfitGraph
