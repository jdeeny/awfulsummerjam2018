local FilmPage = class('FilmPage', Widget)

function FilmPage:initialize(x, y, w, h)
  Widget.initialize(self, x, y, w, h)--, "Film")

  self.colw = self.cw/3 - 1
  self.col1 = 1
  self.col2 = self.colw+2
  self.col3 = self.cw - self.colw

  --local film_list = Widgets.List:new(1,1,10,10)
  --add films
  --film_list.add()

  --local film_panel = Widgets.ScrollPanel:new(self.col1, 1, self.colw, self.ch)
  --film_panel:add(film_list)

  local stats_panel = Widgets.TextPanel:new(self.col2, 1, self.colw, self.ch, Palette.NormalText, "Some stats", {title="Stats"})
  local cast_panel = Widgets.TextPanel:new(self.col3, 1, self.colw, self.ch, Palette.NormalText, "some cast", {title="Cast"})
  local crew_panel = Widgets.TextPanel:new(self.col3, self.ch/2, self.colw, self.ch, Palette.NormalText, "some crew", {title="Crew"})
  --local sequel_button = Widgets.Button:new()

  self:add(film_panel)
  self:add(stats_panel)
  self:add(cast_panel)
  self:add(crew_panel)
  --Widgets.Panel.add(self, sequel_button)
end

return FilmPage
