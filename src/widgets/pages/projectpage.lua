local ProjectPage = class('ProjectPage', Widget)

function ProjectPage:initialize(w, h)
  Widget.initialize(self, w, h)

--  self.project_panel = Widgets.Panel:new(col1,row1,colw,self.ch-2, "PROJECTS")
  --self.project_list = Widgets.List:new(col1+1,row1+1,colw-2,rowh-2)
  --self.project_list:add_list(Game.player.projects)
  --self.project_panel:add(self.project_list)

  --self.pre_panel = Widgets.Panel:new(col2,row1,colw*2+3, rowh, "PRE PRODUCTION")
  --self.pre_panel.hidden = true
  --self.prod_panel = Widgets.Panel:new(col2,row1,colw*2+3, rowh, "IN PRODUCTION")
  --self.prod_panel.hidden = true
  --self.theater_panel = Widgets.Panel:new(col2,row1,colw*2+3, rowh, "IN THEATERS")
  --self.theater_panel.hidden = true
  --self.rentals_panel = Widgets.Panel:new(col2,row1,colw*2+3, rowh, "RENTALS")
  --self.rentals_panel.hidden = true
  --self.help_panel = Widgets.Panel:new(col2,row1,colw*2+3, rowh, "NOTHING PLANNED")
  --self.rentals_panel.hidden = false

  --self.finance_panel = Widgets.Panel:new(col2,row2,colw*2+3, self.ch - row2 - 4, "PROFT / LOSS")

  --self.finance_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))

  --[[self:add(self.project_panel)
  self:add(self.pre_panel)
  self:add(self.prod_panel)
  self:add(self.theater_panel)
  self:add(self.rentals_panel)
  self:add(self.finance_panel)]]
end

--[[function ProjectPage:_draw()
  love.graphics.setCanvas(self.canvas)

  love.graphics.clear(Palette.Background)
  love.graphics.setColor(Palette.Frame)

  Line.drawh(1,1,self.cw, '╒', '═', '╕')
  Line.drawh(1,self.ch-2,self.cw, '╠', '═', '╣')
  Line.drawh(1,self.ch,self.cw, '╚', '═', '╝')
  self:print(1,self.ch-1, '║')
  self:print(self.cw,self.ch-1, '║')
  Line.drawv(1,2, self.ch-4, '║')
  Line.drawv(self.cw,2, self.ch-4,'║')
end]]


return ProjectPage
