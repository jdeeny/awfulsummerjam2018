--[[

For each item given to measure, add all it's children to the queue. If children
are added, the item is put in the results table to await completion.

If there are no children or all the children are complete, then the item's final
size data is calculated. The item is removed form the results list, and marked as
complete.

When a measurement is complete, is data/a flag sent back to trigger a draw?

]]

local PriorityQueue = require 'lib.lpriorityqueue.PriorityQueue')
local Class = require 'lib.middleclass.middleclass'
local channel_id = ...
local mosi = love.thread.getChannel(tostring(channel_id))
local miso = love.thread.getChannel(tostring(channel_id + 1))


-- Define an internal `Queue` class that handles results, children, etc
local Queue = class('Queue')
function Queue:initialize()
  self.queue = PriorityQueue.new('min')
  self.results = {}
  self.complete = {}
end

-- Define stubs that are replaced for each specific queue
function Queue:_is_complete() error("Must define _is_complete for this queue") end
function Queue:_finalize() error("Must define _finalize for this queue") end

function Queue:add(item)
  if self.queue:contains(item) then           -- Don't add an item if it is already queued
    return false
  elseif self.complete[item] then         -- Or if it is already valid
    return nil
  else
    self.queue:enqueue(item, item.depth)
    return true
  end
end

function Queue:next(item)
  if self.queue:is_empty() then return false end

  local child_ids = {}
  local next = self.queue:dequeue()
  -- add each child to the queue, unless
  for i,v in ipairs(next.contents) do
    if self:add(v) then
      child_ids[v.id] = v
    end
  end
  if child_ids:len() == 0 then  -- all children complete
    next:_finalize()
    self:clear_result(next.parent, next.id)
  else
    -- add this item to the results list to wait for children to complete
    self.measure_results[next.id] = child_ids
  end
end


-- remove from result list -- (hmm..)
function Queue:complete_result(item)
  --push a completion thingy msg back
--  if parent
--  if self.results[parent] then
--    self.results[parent][child] = nil
--    if self.results[parent]:len() == 0 then
      --self:clear_result(parent.parent, parent)
    --end
  --end
end



-- Each Queue must have a specialized `_is_complete` and `_finalize` method
local measure_queue = Queue:new()
function measure_queue._is_complete(i) return i:is_measured() end
function measure_queue._finalize(i) return i:_measure() end

local arrange_queue = Queue:new()
function arrange_queue._is_complete(i) return i:is_arranged() end
function arrange_queue._finalize(i) return i:_arrange() end

local teardown = false

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
