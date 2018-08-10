local Movie = class('Movie')

function Movie:initialize(options)
  self.options = options or {}
  self.month_stats = {}
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
  self.rating = chance.helpers.pick({"G", "G", "PG", "PG", "PG-13", "PG-13", "PG-13", "R", "R", "R", "NC-17", "NR"})
  self.release_day = Game.time:indays()
  self.theater_time = chance.misc.normal({mean = Config.DaysPerYear, deviation = 60 })
  self.views = {}
end

function Movie:set_month(views, gross,month)
  self.month_stats[month] = { views=views, gross=gross }
end

function Movie:add_view()
  local d = Game.time:indays()
  if not self.views[d] then
    self.views[d] = 1
  else
    self.views[d] = self.views[d] + 1
  end
end
function Movie:is_in_theaters()
  return Game.time:indays() - self.theater_time > self.release_day
end
function Movie:emit()
  local themestr = ""
  for i,v in ipairs(self.themes) do
    themestr = themestr .. v.word .. " "
  end
  return self.title:emit() .. " / "..self.rating.."\nThemes: "..themestr..
  "\nDir: "..self.director.name:emit()..
  "\nLead: " ..self.lead.name:emit()..
  " / Support: "..self.support.name:emit()
end

function Movie:list_print(x,y,w)
  local themestr = ""
  for i,v in ipairs(self.themes) do
    themestr = themestr .. v.word .. " "
  end
  local x,y = 1,1--Screen.to_px_loc(x,y,w)
  love.graphics.printf(self.title:emit() .. " ("..self.rating..")\nThemes: "..themestr..
    " / Dir: "..self.director.name:emit()..
  " / Lead: " ..self.lead.name:emit()..
  " / Support: "..self.support.name:emit(),x,y,w*8)
end

return Movie
