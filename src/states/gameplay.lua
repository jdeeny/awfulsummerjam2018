local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(2, 2, 120, 45, Palette.Yellow)
  self:_build()
end

function StateGameplay:swap_to_status()
  self:_set_page('Status')
end
function StateGameplay:swap_to_projects()
  self:_set_page('Project')
end
function StateGameplay:swap_to_surveys()
  self:_set_page('Survey')
end
function StateGameplay:swap_to_persondb()
  self:_set_page('Person')
end
function StateGameplay:swap_to_moviedb()
  self:_set_page('Movie')
end

function StateGameplay:_build()
  local buttons = {
    Widgets.Button:new(1, 1, 15, 5, "Status", {onclick = function() self:swap_to_status() end }),
    Widgets.Button:new(17, 1, 15, 5, "Projects", {onclick = function() self:swap_to_projects() end }),
    Widgets.Button:new(33, 1, 15, 5, "Surveys",{onclick = function() self:swap_to_surveys() end }),
    Widgets.Button:new(49, 1, 15, 5, "Person DB",{onclick = function() self:swap_to_persondb() end }),
    Widgets.Button:new(65, 1, 15, 5, "Film DB",{onclick = function() self:swap_to_moviedb() end }),
  }
  for _,v in ipairs(buttons) do
    self.main_window:add(v)
  end

  self.pages = {}
  self.pages['Status'] = Widgets.StatusPage:new(1, 5, Config.PageWidth, Config.PageHeight)
  self.pages['Project'] = Widgets.ProjectPage:new(1, 5, Config.PageWidth, Config.PageHeight)
  self.pages['Survey'] = Widgets.SurveyPage:new(1, 5, Config.PageWidth, Config.PageHeight)
  self.pages['Person'] = Widgets.PersonPage:new(1, 5, Config.PageWidth, Config.PageHeight)
  self.pages['Movie'] = Widgets.MoviePage:new(1, 5, Config.PageWidth, Config.PageHeight)

  for _,v in pairs(self.pages) do
    self.main_window:add(v)
  end
  --self:_set_page('Status')


end

function StateGameplay:_set_page(pagename)
  print("Set page: "..pagename)
  for k, v in pairs(self.pages) do
    if k == pagename then
      print("not hidden " .. pagename)
      v.hidden = false
    else
      v.hidden = true
    end
  end
end

function StateGameplay:enter()
  Game.time.scale = 1.0
  Game.time.ticking = true
  self:_set_page("Status")
end

function StateGameplay:update(dt)
  State.update(self, dt)

  if self.input:pressed('click') then
    local x, y = love.mouse.getPosition()
    print("click: "..x.." "..y)
    self.main_window:click(x, y)
  end

  self.main_window:update(dt)


  if self.input:pressed('continue') then
    Game.state:jump('Ending')
    Game.state:call('Debounce')
  end
end


function StateGameplay:draw()
  love.graphics.setColor(Palette.Wine)
  love.graphics.print("Gameplay", 0, 0)
  self.main_window:draw()
end

function StateGameplay:add_scroll(y)
  print("Scroll: " .. y)
end

return StateGameplay
