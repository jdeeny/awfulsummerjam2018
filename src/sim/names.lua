local Name = class('Name')

--Name.static.surnames = Sim.WordGen.surnames:column_by_name(Sim.WordGen.surnames:column_names()[1])

function Name:initialize(sex, age)
  self.sex = "M"
  if type(sex) == 'string' and #sex >= 1 then
    self.sex = sex:sub(1,1):upper()
  end
  local year = Config.CurrentYear - 30
  if type(age) == number and age < Config.CurrentYear - 1880 and age > 4 then
    local year = Config.CurrentYear - age
  end

  if self.sex == "F" then
    self.firstname = chance.helpers.pick(Sim.WordGen.girl_names)
--    print("Select: "..self.sex .." ".. year.. " cnt: "..#(Sim.WordGen.girl_names))
  else
    self.firstname = chance.helpers.pick(Sim.WordGen.boy_names)
  --  print("Select: "..self.sex .." ".. year.. " cnt: "..#(Sim.WordGen.boy_names))
  end

  self.lastname = chance.helpers.pick(Sim.WordGen.surnames)
end

function Name:emit(flags)
  if flags == "i" then       --informal
    return self.firstname
  end
  if flags == "f" then
    if self.sex == "M" then
      return "Mr. " .. self.lastname
    else
      return "Ms. " .. self.lastname
    end
  end
  if flags == "g" then
    return self.firstname
  end
  if flags == 'l' then
    return self.lastname
  end

  return self.firstname .. " " .. self.lastname
end

return Name
