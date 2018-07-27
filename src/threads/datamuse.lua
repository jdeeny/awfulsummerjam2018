local Thread = require('src.threads.thread')

local DatamuseThread = class('DatamuseThread', Thread)

DatamuseThread.static.cache = lru.new(10e3, 10e6)


function DatamuseThread:initialize()
  self.inner = 'src/threads/search_inner.lua'
  Thread.initialize(self)
end



function DatamuseThread:lookup(query)
  if not query or query == "" then
    return false, nil
  end

  repeat
    local result = self.channels[2]:pop()
    if result then
      local q, r = result
      print("response q: ".. q.. " r: "..r)
      DatamuseThread.cache:set(q, r)
    end
  until not result

  local result = DatamuseThread.cache:get(query)
  if result then
    print("Cached: q: " .. query .. " r: " .. result)
    return true, result
  end

  -- not cached, so look it up
  -- cache as false so that we don't send a zillion queries across the channel
  DatamuseThread.cache:set(query, false, 1)
  print("push q: ", query)
  self.channels[1]:push({ 'request', 'https://api.datamuse.com/words?' .. query } )

  -- true, false means request was value, no response yet
  return true, false
end


return DatamuseThread
