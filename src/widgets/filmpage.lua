local FilmPage = class('FilmPage', Widget)

local row1 = 5
local row2 = 14
local col1 = 2
local colw = (Config.CharWidth - 4) / 2
local col2 = col1 + colw + 3
local rowh = Config.PageHeight-2

function FilmPage:initialize(x,y,w,h)
  Widget.initialize(self,x,y,w,h)

  self.film_panel = Widgets.Panel:new(col1,row1,colw,rowh, "FILMS")
  self.film_list = Widgets.List:new(col1+1,row1+1,colw-2,rowh-2)
  self.film_list:add_list(Game.world.movies)
  self.film_panel:add(self.film_list)

  self.details_panel = Widgets.Panel:new(col2,row1,colw, rowh, "DETAILS")
--  self.projects_panel:add(Widgets.ProjectBars:new(2,15,self.cw-2,15))


  self:add(self.film_panel)
  self:add(self.details_panel)
end

function FilmPage:_draw()
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
end


return FilmPage
