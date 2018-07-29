local Title = class('Title')

function Title:initialize()
  self.sex = (chance.person.gender( { binary = true } )):sub(1,1)
  self.age = chance.person.age()
  while self.age > chance.misc.normal({mean = 70, deviation = 20})
  or self.age < chance.misc.normal({mean = 12, deviation = 2}) do
    self.age = chance.person.age()
  end


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

function Title:emit()
  local interests = ""
  for i,v in ipairs(self.interests) do
    interests = interests .. v .. "   "
  end
  return self.name:emit() .. "  " .. self.age .. " yr " .. self.sex .. "; " .. self.occupation .. "\nInterests: " .. interests
end

return Title




--[[
verb-ing noun
verbing location
name the noun-phrase or the noun-phrase
verb they verb a noun and noun verb?
noun noun noun
The adjective noun
word Part 2
word Part 3
Why Verb? <noun-phrase list>   (x, y, z)
preposition/adverb the noun
name
first name
last name
noun
noun phrase
anyword
adj noun, adj noun
noun phrase, noun phrase
A noun for the noun
Group of capital letters
A noun of noun
verb me noun
The <last = what kind of word?> of the <plurual noun>
<phrase> - <name>
<name> - <phrase>
The adj noun
<numbered noun> to <noun>


]]
