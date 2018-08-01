local Player = class('Player')
local Project = Sim.Project

function Player:initialize()
  self.projects = {}
end

function Player:add_project(movie)
  if #self.projects < 8 then
    table.insert(self.projects, Project:new(movie))
  end
end

function Player:update(dt)
  if self.projects then
    for i,v in ipairs(self.projects) do
      v:update(dt)
    end
  end
end

function Player:get_profit()
  local cash = 0.0
  if self.projects then
    for i,v in ipairs(self.projects) do
      cash = cash + v:get_profit()
    end
  end
  return cash
end

return Player
