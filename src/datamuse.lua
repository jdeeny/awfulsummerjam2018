local Datamuse = class('Datamuse')

  function Datamuse.lookup(query)
    result = http.request('https://api.datamuse.com/words?' .. query)
    cache:set(query, result)
    return result
  end

return Datamuse
