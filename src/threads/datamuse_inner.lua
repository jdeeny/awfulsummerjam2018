
local channel_ids = ...
local channels = { love.thread.getChannel(channel_ids[1]), love.thread.getChannel(channel_ids[2]) }

local teardown = false

repeat
  local req = channels[1]:demand()
  --print("from thread")
  --print(pl.pretty.dump(req))
  --if kind == 'request' then
    channels[2]:push( { req[1], http.request('https://api.datamuse.com/words?' .. req[2]) } )
  --  love.timer.sleep(1000)
--  elif kind == 'teardown' then
    --teardown = true
  --else
  --end
until false -- kind == 'teardown'

error("datamuse thread ended")
