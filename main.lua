require "requires"

local teststr = ""

local datamuse_cache = lru.new(1000)

function love.load()
  teststr = wordtest()
  datamuse_cache = lru.new(1000)
end

function love.update(dt)
end

function love.draw()
  love.graphics.print(teststr ,0, 0)
end

function new_game()
end

function datamuse_lookup_similar(word)
  return datamuse_lookup("ml="..word)
end

function datamuse_lookup(query)
  result = datamuse_cache:get(query)
  if result then
    return result
  end
  result = http.request('https://api.datamuse.com/words?' .. query)
  datamuse_cache:set(query, result)
  return result
end

function wordtest()
  local response = datamuse_lookup("rel_syn=unnecessary&v=enwiki&max=30")
  print(response)
  local result = json.decode(response)
  local output = ""
  for i,v in ipairs(result) do
      local tags = ""
      --[[for i,v in ipairs(v.tags) do
        tags = tags .. " " .. v
      end]]
      local score = v.score or 0
      output = output .. v.word .. "\n"
      print(pl.pretty.write(v))
      print("# ".. i)

  end
  print(output)
  print("----")
  local out = ""
  return output
end
