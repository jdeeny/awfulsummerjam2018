local Movie = class('Movie')

function Movie:initialize()
  -- first come up with themes
  self.themes = {"Themes", "Themes"}

  -- then figure out a title etc
  self.title = Sim.Title:new()
  self.director = "Director"
  self.lead = "Lead"
  self.support = "Support"
  self.rating = "R"

end

return Movie
