local FilmPage = class('FilmPage', Widget)

local row1 = 5
local row2 = Config.PageHeight / 2
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
  self.cast_heading = Widgets.TextPanel:new(col2+1,row1+3,colw/2,1, Palette.HighlightText,"Cast", {center=true})
  self.crew_heading = Widgets.TextPanel:new(col2+1,row2,colw/2,1, Palette.HighlightText, "Crew", {center=true})
  self.keywords_heading = Widgets.TextPanel:new(col2+colw/2,row1+3,colw/2,1, Palette.HighlightText, "Keywords", {center=true})
  self.performance_heading = Widgets.TextPanel:new(col2+colw/2,row2,colw/2,1, Palette.HighlightText, "Performance", {center=true})

  local function make_sequel()
    if self.film_list.highlighted > 0 then
      Game.player:add_project(self.film_list.items[self.film_list.highlighted])
      Game.state.StateList.Gameplay.pages.Project.project_list:add(movie)
      Game.state.StateList.Gameplay:swap_to_projects()
    end
  end

  self.sequel_button = Widgets.Button:new(col2+5, self.cy+self.ch-12, colw-8, 5, "Make Sequel", {
    onclick=make_sequel,
  })
  self.details_panel:add(self.cast_heading)
  self.details_panel:add(self.crew_heading)
  self.details_panel:add(self.keywords_heading)
  self.details_panel:add(self.performance_heading)
  self.details_panel:add(self.sequel_button)
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
