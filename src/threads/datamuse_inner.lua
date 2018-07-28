local http = require('socket.http')
--local Config = require('src.config')

local channel_id = ...
local mosi = love.thread.getChannel(tostring(channel_id))
local miso = love.thread.getChannel(tostring(channel_id + 1))

local teardown = false

--local timeout = 1.0 / Config.DatamuseRate
repeat
  --love.timer.sleep(timeout)
  local query = mosi:demand()
  --print("from thread")
  --if kind == 'request' then

  if query then
    local req = 'https://api.datamuse.com/words?' .. query
    local result = http.request(req)
    miso:push( { q = query, r = result } )
  end
  --  love.timer.sleep(1000)
--  elif kind == 'teardown' then
    --teardown = true
  --else
  --end
until false -- kind == 'teardown'

error("datamuse thread ended")
