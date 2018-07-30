local Movie = class('Movie')

function Movie:initialize(options)
  self.options = options or {}

  -- first come up with themes
  local n_themes = 1 + chance.misc.normal({mean=3,deviation=2})
  local t_words = {}
  for k,v in pairs(Game.wordbase.theme) do
    table.insert(t_words,v)
  end
  local themes = chance.helpers.pick_unique(t_words, n_themes)
  self.themes = themes

  -- then figure out a title etc
  self.title = Sim.Title:new()
  self.director = chance.helpers.pick(Game.world.directors)
  self.lead = chance.helpers.pick(Game.world.actors)
  self.support = chance.helpers.pick(Game.world.actors)
  self.rating = chance.helpers.pick({"G", "PG", "PG-13", "R", "NC-17", "NR"})

end

function Movie:emit()
  local themestr = ""
  for i,v in ipairs(self.themes) do
    themestr = themestr .. v.word .. " "
  end
  return self.title:emit() .. " / "..self.rating.." / Themes: "..themestr..
  "\nDir: "..self.director.name:emit()..
  " / Lead: " ..self.lead.name:emit()..
  " / Support: "..self.support.name:emit()
end

return Movie
