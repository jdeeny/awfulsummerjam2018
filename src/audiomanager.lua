local PooledSource = class('PooledSource')

function PooledSource:initialize(path)
  self.source = love.audio.newSource(path, "static")
  self.pool = {}
  self.count = 0
end

function PooledSource:play()
  -- print(self.count)
  return self:find_available():play()
end

function PooledSource:find_available()
  for id, s in pairs(self.pool) do
    if s:isPlaying() then
    else
      return s
    end
  end

  local s = self.source:clone()
  self.count = self.count + 1
  self.pool[self.count] = s
  return s
end

local AudioManager = class("AudioManager")

function AudioManager:initialize()
  self.fx = {}
  self.music = {}

  -- Short sound effects should be loaded with static to store in memory.
  self.fx['click'] = PooledSource:new("assets/audio/fx/clickdown.ogg")
  self.fx['clickup'] = PooledSource:new("assets/audio/fx/clickup.ogg")

  self.music['office1'] = love.audio.newSource("assets/audio/music/office1.ogg", "static")

end

function AudioManager:addEffect(path, name)
  self.sources[name] = PooledSource:new(path)
end

function AudioManager:playOnce(name, volume)
  if self.sources[name] then
    self.sources[name]:play()
  else
    print("Tried to play sound \'" .. name .. "\' but it doesn't exist.")
  end
end

function AudioManager:playLooped(name, volume)
  if self.sources[name] then
    --self.source[name]:play
  end
end

return AudioManager
