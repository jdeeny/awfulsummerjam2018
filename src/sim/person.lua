local Person = class('Person')

function Person:initialize()
  self.sex = (chance.person.gender( { binary = true } )):sub(1,1)
  self.age = chance.person.age()
  self.name = WordGen.Name:new(self.sex, self.age)
end

function Person:emit()
  return self.name:emit() .. "  " .. self.age .. " yr " .. self.sex
end

return Person
