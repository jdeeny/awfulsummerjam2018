local Actor = class('Actor', Person)

function Actor:initialize()
  Sim.Person.initialize(self)
  self.movies = {}
  self.stats = {
    Popularity = math.random(),

  }
end

return Actor
