local Config = {
  CharWidth = (1280/8),    -- 160x45 is the max for 1280x720, the default size
  CharHeight = 720/16,
  StartYear = 1978,
  GameYear = 1982,
  Population = 50,
  Directors = 12,   -- If this is a history, needs to be per year or something
  Actors = 20,
  --Movies = 10,
  GameInMinutes = 8.0,
  GameYears = 2,
  DaysPerMonth = 30,
  MonthsPerYear = 12,
  MoviesPerYear = 15,
  HistorySpeedup = 200.0,
  ThemeNouns = 10,
  ThemeVerbs = 10,
  ThemeAdjectives = 10,
  DatamuseRate = 10,  -- datamuse requests per second max
  FxVolume = 0.9,
  MusicVolume = 0.7,
  MusicFadeTime = 5,
  NewsHeight = 16 * 3,
  MoviePrice = 20,
  PopScale = 5000,
  Controls = require('src/controls'),
}

Config.TotalDays = Config.GameYears * Config.MonthsPerYear * Config.DaysPerMonth

Config.PageWidth = Config.CharWidth
Config.PageY = 4
Config.PageHeight = Config.CharHeight - 4


Config.EndYear = Config.GameYear + Config.GameYears
Config.GameMonths = Config.GameYears * Config.MonthsPerYear
Config.GameDays = Config.GameMonths * Config.DaysPerMonth
Config.GameInSeconds = Config.GameInMinutes * 60.0
Config.DaysPerSecond = Config.GameDays / Config.GameInSeconds

Config.MoviesPerSecond = Config.MoviesPerYear * Config.GameYears / Config.GameInSeconds

print("Game is " .. Config.GameDays .." days long, " .. Config.DaysPerSecond.. " days/s = " .. Config.GameInSeconds)
print("Movies per sec: "..Config.MoviesPerSecond)
return Config
