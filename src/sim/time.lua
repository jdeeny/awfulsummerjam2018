local Time = class('Time')

function Time:initialize()
  self.year = Config.StartYear
  self.month = 1
  self.day = 1
  self.subday = 0.0

  self.ticking = false
  self.scale = 1.0
end

function Time:reset(when)
  if when == 'GameStart' then
    self.year = Config.GameYear
  else
    self.year = Config.StartYear
  end
  self.month = 1
  self.day = 1
  self.subday = 0.0

  self.ticking = false
  self.scale = 1.0
end

function Time:update(dt)
  if (not self.ticking) or self.year >= Config.EndYear then return end

  self.subday = self.subday + dt * Config.DaysPerSecond * self.scale
  while self.subday >= 1.0 do
    self.subday = self.subday - 1.0
    self.day = self.day + 1
    if self.day > Config.DaysPerMonth then
      self.day = 1
      self.month = self.month + 1
      if self.month > Config.MonthsPerYear then
        self.month = 1
        self.year = self.year + 1
      end
    end
  end
end

function Time:is_historic()
  return self.year < Config.GameYear
end

function Time:is_gameover()
  return self.year >= Config.EndYear
end

return Time
