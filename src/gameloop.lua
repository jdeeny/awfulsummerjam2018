-- This is for things that happen exactly once
function love.load()
  math.randomseed(os.time())
  for i=1,10*(1.0 + 2.0 * math.random()) do
    _ = math.random()
  end
  Text.setup_font()
  Sources = require('src.wordbase.sources')
  new_game()
end


function love.update(dt)
  flux.update(dt) -- Update all tweens
  Game.time:update(dt)
  Game.state:update(dt)
  Game.datamuse:update(dt)
  Game.audiomanager:update(dt)
end

function love.draw()
  Game.state:draw()   -- should draw everything
  love.graphics.print(tostring(Game.time.ticking).." "..tostring(Game.time.year).. " "..tostring(Game.time.month).." "..tostring(Game.time.day).. " "..tostring(Game.time.subday), 1,500)
end

function new_game()
  -- Reset the global `Game` object with defaults
  Game = {
    state = States.Manager:new(),
    search = Threads.search:new(),
    wordbase = Wordbase.wordbase:new(),
    datamuse = Threads.datamuse:new(),
    audiomanager = AudioManager:new(),
    time = Sim.Time:new(),
  }

  Game.audiomanager:new_music({fadein=true})

  Game.datamuse:load_cache()
  Game.datamuse:start()

  Game.world = Sim.World:new()

  -- Fill game states
  Game.state:add(States.StateSplash:new())
  Game.state:add(States.StateIntro:new())
  Game.state:add(States.StateMenu:new())
  Game.state:add(States.StateGameplay:new())
  Game.state:add(States.StateEnding:new())
  Game.state:add(States.StateDebounce:new())

  -- Start the game
  Game.state:jump('Splash')
  -- Immediately debounce
  Game.state:call('Debounce')

end

-- tear down game objects
function end_game()
  Game.datamuse:dump_cache()
end

-- Callback for scroll wheel
function love.wheelmoved(x, y)
  if Game and Game.state then
    Game.state:add_scroll(y)
  end
end
