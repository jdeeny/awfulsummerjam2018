local World = class('World')

function World:initialize()
  self.people = Sim.Population:new()
  local function newactor() return Sim.Actor:new() end
  local function newdirector() return Sim.Director:new() end
  local function newmovie() return Sim.Movie:new() end
  self.actors = chance.misc.n(newactor, Config.Actors)
  self.directors = chance.misc.n(newdirector, Config.Directors)
  self.movies = {} --chance.misc.n(newmovie, Config.Movies)
end

-- the sim advances each day
function World:sim_day()
  -- Everyone decides if they go to a movie
  for i,person in ipairs(self.people) do
    --for each movie in theater do
    --end
  end
  -- and which one

  -- update finance totals
  -- flag charts for update
end

function World:new_npc_movie()
  --print("new movie stub")
  local movie = Sim.Movie:new()
  print(movie:emit()..'\n')
  Game.news:add("Movie Release:   "..movie:emit(), 'normal')
  table.insert(self.movies, movie)
  Game.state.StateList.Gameplay.pages.Movie.film_list:add(movie)
end

return World
