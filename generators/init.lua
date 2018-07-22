WordGenerator = class('WordGenerator')

print(pl.data)
print(pl.data.read)
local nouns,e = pl.data.read('assets/words/most-common-nouns-english.csv')--, {csv=true, delim=','})
local verbs,e = pl.data.read('assets/words/most-common-verbs-english.csv')--, {csv=true, delim=','})
local adjectives,e = pl.data.read('assets/words/adjectives.txt')

local ser = serpent.dump(nouns)
local ok, back = serpent.load(ser)
print (serpent.dump(back))


print(e)

local y = nouns:column_names()
for i,v in ipairs(y) do
  print(i)
  print(v)
end

function WordGenerator.static.generate()
  return "Fuck"
end

function WordGenerator:initialize()

end
