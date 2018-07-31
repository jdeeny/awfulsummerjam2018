local BoxOfficePanel = class('BoxOfficePanel', Widget)

function BoxOfficePanel:initialize(x,y,w,h)
  Widget.initialize(self, x,y,w,h)
  self.oldmonth = 0
end

function BoxOfficePanel:update(dt,x,y)
  Widget.update(self, dt,x,y)
  if Game.time.month ~= self.oldmonth then
    self.clean = false
    self.oldmonth = Game.time.month
  end
end


function BoxOfficePanel:_draw()
  self.clean = true
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Background)
  --print("DRAW BO")
  local month = math.floor(Game.time.year - Config.StartYear) * Config.MonthsPerYear + Game.time.month -1
  --self:print(1,1, tostring(month), Palette.HighlightText)
  --self:print(1,2, tostring(Game.time.year).."  "..tostring(Game.time.month),Palette.HighlightText )
  local bo = Game.world.boxoffice[month] or {}
  for i, v in ipairs(bo) do
    if i < self.ch-5 then
      local s = " " ..i..": "..v.title
      local m = Text.dollars(v.gross)
      s = s .. string.rep(' ', self.cw-6 - #s -#m) .. m
      self:print(3, i, s, Palette.NormalText)
      --print(s)
    else
    end
  end
end

return BoxOfficePanel
