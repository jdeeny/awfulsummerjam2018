local World = class('World')

function World:initialize()
  self.people = Sim.Population:new()
  local function newactor() return Sim.Actor:new() end
  local function newdirector() return Sim.Director:new() end
  local function newmovie() return Sim.Movie:new() end
  self.actors = chance.misc.n(newactor, Config.Actors)
  self.directors = chance.misc.n(newdirector, Config.Directors)
  self.movies = {} --chance.misc.n(newmovie, Config.Movies)
  self.boxoffice = {}
end

-- the sim advances each day
function World:sim_day()
  --print("sim day")
  -- Everyone decides if they go to a movie
  for i=1,10 do
    local person = chance.helpers.pick(self.people.people)
    local movie = chance.helpers.pick(self.movies)
    local base_chance = person:get_base_movie_chance()
    if movie and movie:is_in_theaters() then
      local chance = base_chance * person:get_movie_like(movie)
      if math.random() <= chance then
        --print("person viewed")
        movie:add_view()
        person:add_view(movie)
      end
    end

  end
  function World:sim_month()
    local month = math.floor(Game.time.year - Config.StartYear) * Config.MonthsPerYear + Game.time.month
    local movie_price = Config.MoviePrice
    local today = Game.time:indays()
    local lastmonth = today - Config.DaysPerMonth
    local movie_totals = {}
    for _,movie in ipairs(self.movies) do
      local total = 0
      for day=lastmonth,today do
        total = total + (movie.views[day] or 0) * Config.PopScale
      end
      local gross = total * movie_price
      movie:set_month(total, gross,month)
      table.insert(movie_totals, {views=total,gross=gross,title=movie.title:emit()})
    end
    local s = {}
    for i,v in ipairs(movie_totals) do
      s[0-v.views] = v
    end
    pl.tablex.sort(s)
    local boxoffice = {}
    for k,v in pairs(s) do
      table.insert(boxoffice, v)
    end
    print("Box office: "..month)
    print(pl.pretty.dump(boxoffice))
    self.boxoffice[month] = boxoffice
    -- rank
  end

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
