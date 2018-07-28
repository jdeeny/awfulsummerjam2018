local Wordbase = class('Wordbase')

function Wordbase:_get_theme()
  local words = {}
  local nouns = chance.helpers.pick_unique(Sources.nouns, Config.ThemeNouns)
  local verbs = chance.helpers.pick_unique(Sources.verbs, Config.ThemeVerbs)
  local adjectives = chance.helpers.pick_unique(Sources.adjectives, Config.ThemeAdjectives)
  for i,v in ipairs(nouns) do
    words[v] = {word=v, part='n'}
  end
  for i,v in ipairs(verbs) do
    words[v] = {word=v, part='v'}
  end
  for i,v in ipairs(adjectives) do
    words[v] = {word=v, part='adj'}
  end
  return words
end

function Wordbase:initialize()
  self.priority_lookup = {}
  self.to_lookup = {}
  self.theme = {}
  self.words = {}
  self.connections = {}
  self.theme = self:_get_theme()
  for k,v in pairs(self.theme) do
    table.insert(self.priority_lookup, v)
  end
end

function Wordbase:store_connection(w1, w2, path, value)
  self.connections[path] = {
    w1 = w1,
    w2 = w2,
    path = path,
    value = value
  }
end

function Wordbase:get_word_to_lookup()
  return
    chance.helpers.pick(self.priority_lookup) or
    chance.helpers.pick(self.to_lookup)
end

function Wordbase:store_lookup(word, result)
  local new_prio = {}
  local new_look = {}
  for i,v in ipairs(self.priority_lookup) do
    if v.word ~= word then table.insert(new_prio, v) end
  end
  for i,v in ipairs(self.to_lookup) do
    if v.word ~= word then table.insert(new_look, v) end
  end
  self.priority_lookup = new_prio
  self.to_lookup = new_look

  print("W: "..word)
  --print(pl.pretty.dump(new_prio))
  if self.theme[word] then
    self.theme[word] = result
  else
    self.words[word] = result
  end
  -- need to parse the result and add words
end

return Wordbase
