local PriorityQueue = require 'lib.lpriorityqueue.PriorityQueue')

local channel_id = ...
local mosi = love.thread.getChannel(tostring(channel_id))
local miso = love.thread.getChannel(tostring(channel_id + 1))

local measure_queue = PriorityQueue.new('min')
local arrange_queue = PriorityQueue.new('min')
local teardown = false

local function add_measure(data)
  measure_queue:enqueue(data.item, data.depth)
end
local function add_arrange(data)
  arrange_queue:enqueue(data.item, data.depth)
end

local function measure_next()
end

local function arrange_next()

-- Empty the channel then measure or arrange something; forever
repeat
  -- `pop` returns immediately, use `demand` to block if there isn't any work to do
  if self.measure_queue.empty() and self.arrange_queue.empty() then
    local query = mosi:demand()
  else
    local query = mosi:pop()
  end

  while query do
    local kind, data = query.kind, query.data
    if kind == 'measure' then
      add_measure(data)
    elseif kind == 'arrange' then
      add_arrange(data)
    elseif kind == 'teardown' then
      teardown = true
    else
      error('Unknown query in measure_inner: ' .. tostring(kind))
    end

    query = mosi:pop()
  end

  -- do one measure or arrange and check for a message
  if not self.measure_queue.empty() then
    self:measure_next()
  elseif not self.arrange_queue.empty() then
    self:arrange_next()
  end

until teardown

error("layout thread ended")
