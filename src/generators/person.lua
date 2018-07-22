local Person = class('Person')

function Person:initialize()
  self.name = WordGen.Name:new()
end

function Person:emit()
  return ""--self.name:emit()
end

return Person
