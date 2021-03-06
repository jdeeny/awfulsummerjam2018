local Time = class('Time')

function Time:initialize()
  self.year = Config.StartYear
  self.month = 1
  self.day = 1
  self.subday = 0.0

  self.ticking = false
  self.scale = 1.0
end

function Time:now()
  return self.year, self.month, self.day
end

function Time.static.format(y,m,d)
  return string.format("%04d-%02d-%02d", y,m,d)
end

function Time:emit()
  return string.format("%04d-%02d-%02d", self.year, self.month,self.day)
end

function Time:indays()
  return ((self.year - Config.GameYear) * Config.MonthsPerYear + self.month) * Config.DaysPerMonth + self.day
end

function Time:daysremaining()
  return Config.TotalDays - self:indays()
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

function Time:_do_day()
  Game.world:sim_day()
end
function Time:_do_month()
  Game.world:sim_month()
end
function Time:update(dt)
  if (not self.ticking) or self.year >= Config.EndYear then return end

  local dt = dt * self.scale

  self.subday = self.subday + dt * Config.DaysPerSecond
  while self.subday >= 1.0 do
    self.subday = self.subday - 1.0
    self.day = self.day + 1
    self:_do_day()
    if self.day > Config.DaysPerMonth then
      self.day = 1
      self:_do_month()
      self.month = self.month + 1

      if self.month > Config.MonthsPerYear then
        self.month = 1
        self.year = self.year + 1
      end
    end
  end

  local movie_chance = Config.MoviesPerSecond * dt

  if math.random() <= movie_chance then
    Game.world:new_npc_movie()
  end

end

function Time:is_historic()
  return self.year < Config.GameYear
end

function Time:is_gameover()
  return self.year >= Config.EndYear
end

return Time
