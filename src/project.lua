local Project = class('Project')

function Project:initialize()
  self.title = "A New Project"
  self.state = 'none'
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
