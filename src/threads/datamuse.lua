local Thread = require('src.threads.thread')

local DatamuseThread = class('DatamuseThread', Thread)

DatamuseThread.static.cache = lru.new(10e3, 10e6)


function DatamuseThread:initialize()
  self.inner = 'src/threads/datamuse_inner.lua'
  Thread.initialize(self)
  self.begin = os.time()
  self.requests = 0
  self.lookuperr = 0
  self.cached = 0
  self.thread_req = 0
  self.thread_resp = 0
end

function DatamuseThread:update(dt)
  --[[local w_struct = Game.wordbase:get_word_to_lookup()
  if w_struct and w_struct.word then
    local w = w_struct.word
    --print("lookup: " .. tostring(w))
    if w then
      local ok, result = self:lookup("rel_trg=" .. w .. "&md=p")
      if ok then
        print("Store lookup")
        if type(result) ~= 'boolean' then
          Game.wordbase:store_lookup(w, result)
        end
      end
    end
  end
]]
  repeat
    local result = self.miso:pop()
    if result then
      self.thread_resp = self.thread_resp + 1
      local q, r = result.q, result.r
      --print("response q: ".. tostring(pl.pretty.dump(q)) .. " r: "..tostring(r))
      DatamuseThread.cache:set(q, r)
    end
  until not result

end

function DatamuseThread:lookup(query)
  self.requests = self.requests + 1
  if not query or query == "" then
    self.lookuperr = self.lookuperr + 1
    return false, nil
  end

  local result = DatamuseThread.cache:get(query)
  if result then
    self.cached = self.cached + 1
    print("Cached: q: " .. query )--.. " r: " .. result)
    return true, result
  end

  -- not cached, so look it up
  -- cache as false so that we don't send a zillion queries across the channel
  DatamuseThread.cache:set(query, false, 1)
  print("push q: ", query)
  self.thread_req = self.thread_req + 1
  self.mosi:push(query)

  -- true, false means request was value, no response yet
  return true, false
end

function DatamuseThread:dump_cache()
  local cdump = {}
  for k,v in DatamuseThread.cache:pairs(table_name) do
    if v then
      table.insert(cdump,1,{q=k, r=v})
    end
  end
  local cdump = love.math.compress(pl.pretty.write(cdump), 'lz4', 9)
  local success, msg = love.filesystem.write('cache-dump.bin', cdump)
  --self:load_cache()
end

function DatamuseThread:load_cache()
  local contents, size = love.filesystem.read('cache-dump.bin')
  if type(size) ~= number then
    print("Couldn't load datamuse cache")
    return
  end
  print("cache load size: ".. tostring(size))
  if size > 0 then
    local res = pl.pretty.read(love.math.decompress(contents, 'lz4'))
    if res then
      local count = 0
      for k,v in pairs(res) do
        count = count + 1
        DatamuseThread.cache:set(k, v)
      end
      print("Cache loaded: ".. count)
    end
  end
end

function DatamuseThread:stats()
  return self.requests .. " req " .. self.cached .. " cached\n"..
          self.thread_req .. " thread req "..self.thread_resp.." thread resp\n"..
          self.lookuperr.." lookup err"


end

return DatamuseThread
