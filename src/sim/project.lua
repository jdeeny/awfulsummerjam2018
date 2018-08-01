local Movie = require('src.sim.movie')
local Project = class('Project', Movie)

function Project:initialize(movie)
  Movie.initialize(self)
  --[[self.title = {}
  for i,v in ipairs(movie.title) do
    table.insert(self.title, v)
  end]]

  table.insert(self.title, "2") -- TODO make smarter
  self.state = 'pre'
  self.gross = 0.0
  self.expenses = 0.0
  self.time_to_next = math.min(10,chance.misc.normal({mean=Config.DaysPerYear / 16,deviation=Config.DaysPerYear / 64}))
  Game.news:add(self.title:emit() .. " begins pre-production", 'direct')

end

function Project:_go_next()
  if self.state == 'released' then return end

  if self.state == 'pre' then

    self.time_to_next = math.min(10,chance.misc.normal({mean=Config.DaysPerYear,deviation=Config.DaysPerYear / 4}))
    self.state = 'prod'
    Game.news:add(self.title:emit() .. " enters production", 'direct')
  elseif self.state == 'prod' then
    self.time_to_next = math.min(10,chance.misc.normal({mean=Config.DaysPerYear / 8,deviation=Config.DaysPerYear / 32}))
    Game.news:add(self.title:emit() .. " ends production", 'direct')
    self.state = 'post'
  elseif self.state == 'post' then
    self.time_to_next = 0
    self.state = 'released'
    Game.news:add("Movie Release:   "..movie:emit(), 'direct')
    table.insert(self.movies, self)
    Game.state.StateList.Gameplay.pages.Movie.film_list:add(self)

  end
  print("Project new state: "..self.state)
end
function Project:Update(dt)
  Movie.update(self,dt)
  if self.state == 'released' then return end
  self.time_to_next = self.time_to_next - dt
  if self.time_to_next <= 0.0 then self:_go_next() end
end

function Project:emit()
  return "A Project!"
end

function Project:get_profit()
  return self.gross - self.expenses
end

return Project
