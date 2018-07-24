
local WordGen = class('WordGen')



local surnames = pl.data.read('assets/data/names/census2000-surnames.csv', {csv=true})
local nouns = pl.data.read('assets/data/words/most-common-nouns-english.csv')--, {csv=true, delim=','})
local verbs = pl.data.read('assets/data/words/most-common-verbs-english.csv')--, {csv=true, delim=','})
local adjectives = pl.data.read('assets/data/words/adjectives.txt')
local occupations = pl.data.read('assets/data/occupations/occupations.csv', {csv=true, delim=','})
local interests = pl.data.read('assets/data/interests/interests.txt', {csv=true, delim=';'})


WordGen.surnames = {}
for i,v in ipairs(surnames:column_by_name(surnames:column_names()[1])) do
  table.insert(WordGen.surnames, (v:sub(1,1):upper() or "") .. (v:sub(2):lower() or ""))
end



local girlnames = pl.data.read('assets/data/names/girlnames.txt')
local boynames = pl.data.read('assets/data/names/boynames.txt')

WordGen.girl_names = girlnames:column_by_name(girlnames:column_names()[1])
WordGen.boy_names = boynames:column_by_name(boynames:column_names()[1])


WordGen.nouns = nouns
WordGen.verbs = verbs
WordGen.adjectives = adjectives
WordGen.occupations = occupations:column_by_name(occupations:column_names()[1])
WordGen.interests = interests:column_by_name(interests:column_names()[1])
WordGen.Name = require 'src.sim.names'


return WordGen
