local Person = class('Person')

function Person:initialize()
  self.stats = {}
  self.views = {}
  self.sex = (chance.person.gender( { binary = true } )):sub(1,1)
  self.age = chance.person.age()
  while self.age > chance.misc.normal({mean = 70, deviation = 20})
  or self.age < chance.misc.normal({mean = 12, deviation = 2}) do
    self.age = chance.person.age()
  end
  self.base_movie_chance = math.max(0.0,math.min(1.0, chance.misc.normal({mean=0.5})))

  self.name = Sim.Name:new(self.sex, self.age)
  self.occupation = chance.helpers.pick(Sources.occupations)
  local retired = self.age > chance.misc.normal({ mean = 65, deviation = 6 })
  if retired then
    self.occupation = self.occupation .. " (ret.)"
  end
  local student = self.age < chance.misc.normal({mean = 21, deviation = 3 })
  if student then
    self.occupation = "Student"
  end
  local child = self.age < chance.misc.normal({mean = 5, deviation = 1 })
  if child then
    self.occupation = "None"
  end

  local num_interests = 0
  while num_interests < 1 or num_interests > 8 do
    num_interests = chance.misc.normal({mean = 4, deviation = 3})
  end

  -- print(pl.pretty.dump(Game.wordbase.interests))
  local function pick_interest() return chance.helpers.pick(Sources.interests) end
  self.interests = chance.misc.unique(pick_interest, num_interests )
  --print(pl.pretty.dump(self.interests))
end

function Person:add_view(movie)
  local t = movie.title:emit()
  if not self.views[t] then
    self.views[t] = 1
  else
    self.views[t] = self.views[t] + 1
  end
end

function Person:get_base_movie_chance()
  return self.base_movie_chance
end

function Person:get_movie_like(movie)
  local t = movie.title:emit()
  if not self.views[t] then
    return 0.5
  else
    local v = 0.0
    for i=1,self.views[t] do
      v = math.max(v, chance.misc.normal({mean=0.5}))
    end
    return math.min(1.0, math.max(0.0, v))
  end
end

function Person:emit()
  local interests = ""
  for i,v in ipairs(self.interests) do
    interests = interests .. v .. "   "
  end
  return self.name:emit() .. "  " .. self.age .. " yr " .. self.sex .. "; " .. self.occupation .. "\nInterests: " .. interests
end

return Person
