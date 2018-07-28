local sources = {
  raw = {
    surnames = pl.data.read('assets/data/names/census2000-surnames.csv', {csv=true}),
    nouns = pl.data.read('assets/data/words/most-common-nouns-english.csv'),
    verbs = pl.data.read('assets/data/words/most-common-verbs-english.csv'),
    adjectives = pl.data.read('assets/data/words/adjectives.txt'),
    occupations = pl.data.read('assets/data/occupations/occupations.csv', {csv=true, delim=','}),
    interests = pl.data.read('assets/data/interests/interests.txt', {csv=true, delim=';'}),
    girlnames = pl.data.read('assets/data/names/girlnames.txt'),
    boynames = pl.data.read('assets/data/names/boynames.txt'),

  },
  surnames = {},
  girl_names = {},
  boy_names = {},
  nouns = {},
}


for i,v in ipairs(sources.raw.surnames:column_by_name(sources.raw.surnames:column_names()[1])) do
  table.insert(sources.surnames, (v:sub(1,1):upper() or "") .. (v:sub(2):lower() or ""))
end


sources.girl_names = sources.raw.girlnames:column_by_name(sources.raw.girlnames:column_names()[1])
sources.boy_names = sources.raw.boynames:column_by_name(sources.raw.boynames:column_names()[1])

sources.nouns = sources.raw.nouns:column_by_name(sources.raw.nouns:column_names()[1])
sources.verbs = sources.raw.verbs:column_by_name(sources.raw.verbs:column_names()[1])
sources.adjectives = sources.raw.adjectives:column_by_name(sources.raw.adjectives:column_names()[1])
sources.occupations = sources.raw.occupations:column_by_name(sources.raw.occupations:column_names()[1])
sources.interests = sources.raw.interests:column_by_name(sources.raw.interests:column_names()[1])
sources.raw = nil

print ("Saving cache")
local pretty,err = pl.pretty.write(sources)
print(err)

love.filesystem.write('sources.bin', love.math.compress(pretty, 'lz4', 9))
return sources
