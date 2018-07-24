local Population = class('Population')

function Population:initialize(count)
  local function new_person() return Sim.Person:new() end
  self.people = chance.misc.n(new_person, (count and count > 0 and count) or Config.Population)
end

return Population
