local Director = class('Director', Person)

function Director:initialize()
  Sim.Person.initialize(self)
  while self.age < 15 do
    Sim.Person.initialize(self) end
  self.movies = {}
end

return Director
