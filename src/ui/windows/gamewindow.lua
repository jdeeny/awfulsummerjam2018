local game_window = Window:new(
  --Loc:new('ch', {1, 1}),
  --Dist:new('ch', {Config.ScreenWidth, Config.ScreenHeight})
)

print(pl.pretty.dump(game_window))

local the_screen = Widgets.Panel:new({id='screen'})

the_screen:add(Widgets.Panel:new({
  id = 'tabbox',
}))

the_screen:add(
  Widgets.TabBar:new({
    id = 'tabs',
    desired_height = '4 ch',
    desired_width = '40%',
    target = 'tabbox',
    tabs = {
      status = { 'Status', Widgets.StatusPage:new() },
      projects = { 'Projects', Widgets.ProjectPage:new() },
      surveys = { 'Surveys', Widgets.SurveyPage:new() },
      persondb = { 'Person DB', Widgets.PersonPage:new() },
      filmdb = { 'Film DB', Widgets.FilmPage:new() },
    }})
  )


  the_screen:add(Widgets.TextPanel:new({
    id = 'title',
    text = 'Aperiology',
    color = Palette.HighlightText,
    float = true,
    valign = 'top',
    halign = 'right',
  }))


  print(pl.pretty.dump(game_window))

  game_window:constrain('tabs', 'above', 'tabbox')
  game_window:constrain('title', 'rightof', 'tabs')
  game_window:constrain('title', 'above', 'tabbox')


  --the_screen:add(Widgets.MoneyInfo:new({id = 'money_status'}))
  --[[the_screen:add(Widgets.TextPanel:new(
  {
  id = 'date_status',
  color = Palette.HighlightText,
  data = function() return Game.time:emit() end
}
))]]

--self.status_profit = Widgets.MoneyInfo:new(3, Config.CharHeight - 2, 20, Game.player:get_profit() )
--self.main_window:add(self.status_profit)

--self.status_date = Widgets.TextPanel:new(20, 1, Palette.HighlightText, Game.time:emit())
--self.main_window:add(self.status_date)

--self.heading = Widgets.TextPanel:new(20, 1, Palette.HighlightText, "Aperiology")
--self.main_window:add(self.heading)


--[[

  local bwidth = 20
  local bheight = 3
  local buttons = {
    Widgets.Button:new(1, 1, bwidth, bheight, "Status", {onclick = function() self:swap_to_status() end }),
    Widgets.Button:new(1 + bwidth, 1, bwidth, bheight, "Projects", {onclick = function() self:swap_to_projects() end }),
    Widgets.Button:new(1 + 2 * bwidth, 1, bwidth, bheight, "Surveys", {onclick = function() self:swap_to_surveys() end }),
    Widgets.Button:new(1 + 3 * bwidth, 1, bwidth, bheight, "Person DB", {onclick = function() self:swap_to_persondb() end }),
    Widgets.Button:new(1 + 4 * bwidth, 1, bwidth, bheight, "Film DB", {onclick = function() self:swap_to_moviedb() end }),
  }
  for _, v in ipairs(buttons) do
    self.main_window:add(v)
  end

  self.pages = {}
  self.pages['Status'] = Widgets.StatusPage:new()--Config.PageWidth, Config.PageHeight)
  self.pages['Project'] = Widgets.ProjectPage:new()--Config.PageWidth, Config.PageHeight)
  self.pages['Survey'] = Widgets.SurveyPage:new()--Config.PageWidth, Config.PageHeight)
  self.pages['Person'] = Widgets.PersonPage:new()--Config.PageWidth, Config.PageHeight)
  self.pages['Movie'] = Widgets.FilmPage:new()--Config.PageWidth, Config.PageHeight)

  for _, v in pairs(self.pages) do
    self.main_window:add(v)
  end
  ]]
--self:_set_page('Status')

print(pl.pretty.dump(game_window))


return game_window
