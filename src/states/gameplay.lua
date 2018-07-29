local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

  self.main_window = Window:new(2, 2, 120, 45, Palette.Yellow)
  self:_build()
end

function StateGameplay:swap_to_status()
  self.viewed_page = Widgets.StatusPage:new(1, 10, Config.PageWidth, Config.PageHeight)
end
function StateGameplay:swap_to_projects()
  self.viewed_page = Widgets.ProjectPage:new(1, 10, Config.PageWidth, Config.PageHeight)
end
function StateGameplay:swap_to_surveys()
  self.viewed_page = Widgets.SurveyPage:new(1, 10, Config.PageWidth, Config.PageHeight)
end
function StateGameplay:swap_to_persondb()
  print("Person")
  self.viewed_page = Widgets.PersonPage:new(1, 10, Config.PageWidth, Config.PageHeight)
end
function StateGameplay:swap_to_moviedb()
  self.viewed_page = Widgets.MoviePage:new(1, 10, Config.PageWidth, Config.PageHeight)
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

  print("!!!")
  --self.viewed_page = Widgets.FilmPage:new(1, 10, 120, 35)
  print("###")
  --self.main_window:add(self.viewed_page)

  --local calendar = Widgets.CalendarPanel:new(130,1, 28, 43, 2, 2)
  --self.main_window:add(calendar)
end


function StateGameplay:enter()
  Game.time.scale = 1.0
  Game.time.ticking = true

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
