
WordGen = class('WordGen')

WordGen.Name = require 'src.generators.names'
WordGen.Person = require 'src.generators.person'

local nouns,e = pl.data.read('assets/data/words/most-common-nouns-english.csv')--, {csv=true, delim=','})
local verbs,e = pl.data.read('assets/data/words/most-common-verbs-english.csv')--, {csv=true, delim=','})
local adjectives,e = pl.data.read('assets/data/words/adjectives.txt')

local ser = serpent.dump(nouns)
local ok, back = serpent.load(ser)
print (serpent.dump(back))


print(e)

local y = nouns:column_names()
for i,v in ipairs(y) do
  print(i)
  print(v)
end

function WordGen.static.generate()
  return "Fuck"
end

function WordGen:initialize()

end

local x = { "The", nouns, "One", 4 }
for i,v in ipairs(x) do
  print("$"..i)
  print(type(v))
end
