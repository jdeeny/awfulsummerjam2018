local Title = class('Title')

Title.static.patterns = {
--  { 'phrase' },
  { 'word' },
  { "#The", 'phrase' },
  { "#The", 'word' },
  -- { { 'verbing', 'noun' },
  -- { { 'verbing', 'location' },
  -- { { 'firstname', 'the', 'nounphrase' } }
  { 'noun', '#/', 'noun', '#/', 'noun' },
  { 'noun', ',', 'noun', ',', 'noun'},
  { 'verb', ',', 'verb', ',', '#and', 'verb'},
  { 'firstname', '#and', 'firstname'},
  { 'title', '#Part', 'number' },
  { 'name' },
  { 'firstname' },
  { 'lastname' },
  { 'adj', 'lastname' },
  { 'adj', 'firstname' },
  { 'adjnoun', ',', 'adjnoun' },
  --{ 'phrase', ',', 'phrase' },
  { '#A', 'noun', '#for the', 'noun' },
  { 'capitals' },
  { 'capitals', ':', 'title' },
  { '#A', 'noun', '#of', 'noun' },
  { 'verb', '#Me', ',', 'noun' },
  --{ '#The Last of the', 'pluralnoun' },
  { '#The', 'adjnoun' },
  { 'name', '-', 'phrase' },
  { 'phrase', '-', 'name' },
  { 'firstname', "'s", "nounorverb" },
  { 'title', 'number' },
  { 'title', 'roman' },

  --{ 'number', 'pluralnoun', '#to', 'noun' }
}


Title.static.madlib = {
  word = { 'noun', 'verb', 'adj', },
  phrase = { 'noun', 'verb', 'adj' }, --same as word because this is harder
  nounorverb = { 'noun', 'verb' },
  roman = { "#II", "#III", "#IV", "#V"},
}

function Title:_decode(title_item)
  local item = title_item or ""
  if #item == 0 then
    return ""
  end
  if item == '.' or item == ',' or item == ':' or item == "'s" or item == '-' then  --punctuation
    return item
  end
  if string.sub(item,1,1) == '#' then
    return string.sub(item,2)
  end

  -- otherwise it's a keyword
  if Title.madlib[item] then
    return Title:_decode(chance.helpers.pick(Title.madlib[item]))
  end

  if item == 'noun' then
    return Text.namecase(Game.wordbase:get_noun(self.theme))
  elseif item == 'verb' then
    return Text.namecase(Game.wordbase:get_verb(self.theme))
  elseif item == 'adj' then
    return Text.namecase(Game.wordbase:get_adj(self.theme))
  elseif item == 'adjnoun' then
    return Text.namecase(Game.wordbase:get_adjnoun(self.theme))
  elseif item == 'firstname' then
    return Text.namecase(Game.wordbase:get_firstname(self.theme))
  elseif item == 'lastname' then
    return Text.namecase(Game.wordbase:get_lastname(self.theme))
  elseif item == 'name' then
    return Text.namecase(Game.wordbase:get_name(self.theme))
  elseif item == 'capitals' then

    local letters = chance.misc.n(function() return chance.basic.character({group='upper'}) end, math.max(1, chance.misc.normal({mean=3})))
    local s = ""
    for i,v in ipairs(letters) do
      s = s .. v
    end
    return "#"..s
  elseif item == 'number' then
    return tostring(math.floor(1 + math.abs(chance.misc.normal({mean=2,deviation=3}))))
  elseif item == 'title' then
    local tit = Title:new(self.theme)
    return tit:emit()
  else
    return "<unknown " .. item .. ">"
  end
  --[[elseif k == 'verb' then
    return Game.wordbase:get_verb(self.theme)
  elseif k == 'adj' then
    return Game.wordbase:get_adj(self.theme)
  elseif k == 'adjnoun' then
    return Game.wordbase:get_adjnoun(self.theme)
  else
    return "!!"
  end]]
end

function Title:initialize(movie_theme)
  self.theme = movie_theme
  self.words = {}
  self.pattern = chance.helpers.pick(Title.patterns)
  print (pl.pretty.dump(self.pattern))

  for i,v in ipairs(self.pattern) do
    self.words[i] = self:_decode(v)
  end
end

function Title:emit()
  --[[local interests = ""
  for i,v in ipairs(self.interests) do
    interests = interests .. v .. "   "
  end
  return self.name:emit() .. "  " .. self.age .. " yr " .. self.sex .. "; " .. self.occupation .. "\nInterests: " .. interests]]
  local s = ""
  for i=1,#self.words do
    local w = self.words[i]
    if i == 1 or w == "'s" or w ==',' or w == '.' then
      s = s .. w
    else
      s = s .. " ".. w
    end
  end
  return s

end

return Title




--[[

The <last = what kind of word?> of the <plurual noun>
<numbered noun> to <noun>

preposition/adverb the noun
verb they verb a noun and noun verb?
Why Verb? <noun-phrase list>   (x, y, z)

]]
