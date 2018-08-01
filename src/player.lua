local Player = class('Player')
local Project = Sim.Project

function Player:initialize()
  self.projects = {}
end

function Player:get_profit()
  local cash = 0.0
  for i,v in ipairs(self.projects) do
    cash = cash + v:get_profit()
  end
  return cash
end

return Player
