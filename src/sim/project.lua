local Movie = require('src.sim.movie')
local Project = class('Project', Movie)

function Project:initialize(movie)
  Movie.initialize(self)
  self.title = {}
  for i,v in ipairs(movie.title) do
    table.insert(self.title, v)
  end

  table.insert(self.title, "2") -- TODO make smarter
  self.state = 'pre'
  self.gross = 0.0
  self.expenses = 0.0
end

function Project:emit()
  return "A Project!"
end

function Project:get_profit()
  return self.gross - self.expenses
end

return Project
