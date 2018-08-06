local Thread = class('Thread', Thread)

local ThreadJump = 10
Thread.static.count = 0

function Thread:initialize()
  if not self.inner then return end
  self.thread = love.thread.newThread(self.inner)
  self.channel_id = Thread.count
  self.mosi = love.thread.getChannel(tostring(self.channel_id))
  self.miso = love.thread.getChannel(tostring(self.channel_id + 1))

  print("Thread init: ")
  Thread.count = Thread.count + ThreadJump
end

function Thread:start()
    print("START")
    self.thread:start(self.channel_id)
    print(self.channel_id)
    print("_")
end


return Thread
