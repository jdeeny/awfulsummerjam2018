local Name = class('Name')

Name.static.lastnames,e = pl.data.read('assets/data/names/census2000-surnames.csv')--, {csv=true, delim=','})
--Name.static.firstnames,e = pl.data.read('assets/data/.csv')--, {csv=true, delim=','})

function Name:initialize(sex)
  self.sex = sex or chance.person.gender()
  print(self.sex)
end

function Name:emit(flags)
  if flags == "i" then       --informal
    return self.firstname
  end
  if flags == "f" then
    if self.sex and #self.sex > 0 and self.sex[1] == "M" then
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
