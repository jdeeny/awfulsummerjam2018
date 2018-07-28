local Sources = {
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

for i,v in ipairs(Sources.raw.surnames:column_by_name(Sources.raw.surnames:column_names()[1])) do
  table.insert(Sources.surnames, (v:sub(1,1):upper() or "") .. (v:sub(2):lower() or ""))
end




Sources.girl_names = Sources.raw.girlnames:column_by_name(Sources.raw.girlnames:column_names()[1])
Sources.boy_names = Sources.raw.boynames:column_by_name(Sources.raw.boynames:column_names()[1])


Sources.nouns = Sources.raw.nouns:column_by_name(Sources.raw.nouns:column_names()[1])
Sources.verbs = Sources.raw.verbs:column_by_name(Sources.raw.verbs:column_names()[1])
Sources.adjectives = Sources.raw.adjectives:column_by_name(Sources.raw.adjectives:column_names()[1])
Sources.occupations = Sources.raw.occupations:column_by_name(Sources.raw.occupations:column_names()[1])
Sources.interests = Sources.raw.interests:column_by_name(Sources.raw.interests:column_names()[1])

Sources.raw = nil
return Sources
