local Thread = require('src.threads.thread')

local LayoutThread = class('LayoutThread', Thread)

function LayoutThread:initialize()
  self.inner = 'src/threads/layout_inner.lua'
  Thread.initialize(self)
  self.begin = os.time()
  self.stats = {
    measures = 0,
    arranges = 0,
  }
end

function LayoutThread:pump()
  if self.thread:getError() then error('Layout thread err: ' .. self:getError()) end

  repeat
    local result = self.miso:pop()
    if result then
      self.stats.results = self.stats.results + 1
      local kind, data, version = result.kind, result.data, result.version

    end
  until not result
end

function LayoutThread:measure(item, callback)
  self.stats.measures = self.stats.measures + 1
  self.mosi:push( { kind = 'measure', item = item, callback = callback } )
end

function LayoutThread:arrange(item, callback)
  self.stats.arranges = self.stats.arranges + 1
  self.mosi:push( { kind = 'arrange', item = item, callback = callback } )
end


return LayoutThread
