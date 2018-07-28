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

  self.currentmusic = ''
  self.old_music_vol = 0.0
  self.music_vol = Config.FxVolume
  self.fx_vol = Config.FxVolume
end

function AudioManager:add_effect(path, name)
  self.fx[name] = PooledSource:new(path)
end

function AudioManager:play_once(name)
  if self.fx[name] then
    self.fx[name]:play(self.fx_vol)
  else
    print("Tried to play sound \'" .. name .. "\' but it doesn't exist.")
  end
end

function AudioManager:duck_music()
end

function AudioManager:update(dt)
  if self.old_music_vol ~= self.music_vol and self.music[self.currentmusic] then
    self.music[self.currentmusic]:setVolume(self.music_vol)
    self.old_music_vol = self.music_vol
  end
end

function AudioManager:new_music(options)
  local options = options or {}
  if options.fadein then
    self.music_vol = 0
    flux.to(self, Config.MusicFadeTime, { music_vol = Config.MusicVolume } )
  else
    self.music_vol = Config.MusicVolume
  end
  local m = 'office1'
  print("music = "..m)
  self.currentmusic = m
  if self.music[m] then
    self.music[m]:setLooping(true)
    self.music[m]:setVolume(self.music_vol)
    self.music[m]:play()
  end
end

return AudioManager
