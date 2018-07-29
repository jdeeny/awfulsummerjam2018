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
  self.director = "Director"
  self.lead = "Lead"
  self.support = "Support"
  self.rating = "R"

end

function Movie:emit()
  local themestr = ""
  for i,v in ipairs(self.themes) do
    themestr = themestr .. v.word .. " "
  end
  return self.title:emit() .. "\nThemes: "..themestr
end

return Movie
