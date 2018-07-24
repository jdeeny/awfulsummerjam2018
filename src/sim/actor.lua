local Actor = class('Actor', Person)

function Actor:initialize()
  Sim.Person.initialize(self)
  self.movies = {}
end

return Actor
