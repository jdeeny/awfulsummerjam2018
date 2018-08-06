local ProjectBars = class('ProjectBars', Widget)

function ProjectBars:initialize(w, h)
  Widget.initialize(self, w, h)

  self.titles = {}
  self.bars = {}
  self.barwidth = 0
  self.titlewidth = 0
  self.col1 = 1
  self.col2 = self.cw / 2

  for i=1,8 do
    --self.bars[i] = Widgets.ProfitBar:new((i <= 4 and self.col1 or self.col2)+self.titlewidth+1, i%4, self.barwidth, 1)
    self.bars[i] = Widgets.ProfitBar:new(1,1,10,10)
    self.add(self.bars[i])
    --self.titles[i] = Widgets.TextPanel:new((1 <= 4 and self.col1 or self.col2), i%4, self.titlewidth, 1)
    self.titles[i] = Widgets.TextPanel:new(1,1,10,10,"AA")
    self.add(self.titles[i])
  end

end

--[[function ProjectBars:update(dt, x, y)
  Widget.update(self, dt, x, y)

  if self.old_mode ~= self.mode then self.clean = false end
  self.old_mode = self.mode
end]]

function ProjectBars.set_data(data)
  self.data = data or {}
  self.clean = false
end

function ProjectBars:_draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(Palette.Background)

  Line.drawv(15,1,self.ch-1,'│')
--[[  local dwidth = #self.data
  local remainder = self.cw - dwidth
  for x=1,self.cw do
    for y=1,self.ch do
      if x < remainder then
        love.graphics.setColor(grey)
        self:print(x, y, gradient[1])
      else
        local d = self.data[x-remainder]
        love.graphics.setColor((d > 0 and green) or red)
        self:print(x, y, gradient[math.max(math.min(#gradient, d*#gradient), 1)]
      end
    end]]
  end

return ProjectBars
