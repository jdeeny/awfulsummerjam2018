local StatusWindow = Window:new()



local panel = Widgets.Dock:new({id = 'statuspanel', orientation = 'vertical'})
StatusWindow:add(panel)

  panel:add(Widgets.MoneyInfo:new({id='money_status'}))
  panel:add(Widgets.TextPanel:new({id='date_status', color=Palette.HighlightText}, data=function() Game.time:emit() end))
  panel:add(Widgets.TextPanel:new({id=''}))
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



  return StatusWindow
