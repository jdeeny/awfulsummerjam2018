local Config = {
  CharWidth = (1280/8),    -- 160x45 is the max for 1280x720, the default size
  CharHeight = 720/16,
  StartYear = 1962,
  GameYear = 1982,
  Population = 1000,
  Directors = 15,   -- If this is a history, needs to be per year or something
  Actors = 30,
  Movies = 30,
  GameInMinutes = 8.0,
  GameYears = 2,
  DaysPerMonth = 10,
  MonthsPerYear = 12,
  MoviesPerYear = 8,
  HistorySpeedup = 1000.0,
  ThemeNouns = 10,
  ThemeVerbs = 10,
  ThemeAdjectives = 10,
  DatamuseRate = 10,  -- datamuse requests per second max
  FxVolume = 0.7,
  MusicVolume = 0.4,
  MusicFadeTime = 5,

  Controls = require('src/controls'),
}
Config.PageWidth = Config.CharWidth
Config.PageHeight = Config.CharHeight - 3


Config.EndYear = Config.GameYear + Config.GameYears
Config.GameMonths = Config.GameYears * Config.MonthsPerYear
Config.GameDays = Config.GameMonths * Config.DaysPerMonth
Config.GameInSeconds = Config.GameInMinutes * 60.0
Config.DaysPerSecond = Config.GameDays / Config.GameInSeconds

Config.MoviesPerSecond = Config.MoviesPerYear * Config.GameYears / Config.GameInSeconds

print("Game is " .. Config.GameDays .." days long, " .. Config.DaysPerSecond.. " days/s = " .. Config.GameInSeconds)
print("Movies per sec: "..Config.MoviesPerSecond)
return Config
