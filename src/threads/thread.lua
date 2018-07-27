local Thread = class('Thread', Thread)

Thread.static.count = 0

function Thread:initialize()
  if not self.inner then return end
  self.thread = love.thread.newThread(self.inner)
  self.channel_ids = { tostring(Thread.count), tostring(Thread.count + 1) }
  self.channels = { love.thread.getChannel(self.channel_ids[1]), love.thread.getChannel(self.channel_ids[2]) }
  Thread.count = Thread.count + 2
end

function Thread:start()
    print("START")
    self.thread:start(self.channels_ids)
end


return Thread
