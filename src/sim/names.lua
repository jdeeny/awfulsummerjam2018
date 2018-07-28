local Name = class('Name')

--Name.static.surnames = Game.wordbase.surnames:column_by_name(Game.wordbase.surnames:column_names()[1])

function Name:initialize(sex, age)
  self.sex = "M"
  if type(sex) == 'string' and #sex >= 1 then
    self.sex = sex:sub(1,1):upper()
  end
  local year = Config.GameYear - 30
  if type(age) == number and age < Config.GameYear - 1880 and age > 4 then
    local year = Config.GameYear - age
  end

  if self.sex == "F" then
    self.firstname = chance.helpers.pick(Words.girl_names)
--    print("Select: "..self.sex .." ".. year.. " cnt: "..#(Game.wordbase.girl_names))
  else
    self.firstname = chance.helpers.pick(Words.boy_names)
  --  print("Select: "..self.sex .." ".. year.. " cnt: "..#(Game.wordbase.boy_names))
  end

  self.lastname = chance.helpers.pick(Words.surnames)
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
