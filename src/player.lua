local Player = class('Player')

function Player:initialize()
  self.projects = { Project:new(), Project:new(), Project:new(), Project:new(),
                    Project:new(), Project:new(), Project:new(), Project:new(),
                  }

end

function Player:get_profit()
  local cash = 0.0
  for i,v in ipairs(self.projects) do
    cash = cash + v:get_profit()
  end
  return cash
end

return Player
