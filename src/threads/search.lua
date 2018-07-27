local Thread = require('src.threads.thread')

local SearchThread = class('SearchThread', Thread)

function SearchThread:initialize()
  self.inner = 'src/threads/search_inner.lua'
  Thread.initialize(self)
end

return SearchThread
