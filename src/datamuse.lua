local Datamuse = class('Datamuse')

  -- Cache the requests, store up to 10k entries or 10M bytes
  local cache = lru.new(10e3, 10e6)

  function Datamuse.lookup(query)
    local query = query or ""
    if query == "" then return "" end
    local result = cache:get(query)
    if result then
      return result
    end
    result = http.request('https://api.datamuse.com/words?' .. query)
    cache:set(query, result)
    return result
  end

return Datamuse
