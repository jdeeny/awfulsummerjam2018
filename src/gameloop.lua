-- This is for things that happen exactly once
function love.load()
  math.randomseed(os.time())
  for i=1,10*(1.0 + 2.0 * math.random()) do
    _ = math.random()
  end
  Text.setup_font()
  -- Add a unit for characters (8x16px, topleft is 1,1, return integers only)
  Screen.set_unit('ch', {8,16}, {1,1}, true)
  new_game()
end


function love.update(dt)
  flux.update(dt) -- Update all tweens
  Game.time:update(dt)
  Game.state:update(dt)
  Game.datamuse:update(dt)
  Game.audiomanager:update(dt)
  Game.player:update(dt)
end

function love.draw()
  Game.state:draw()   -- everything is drawn by the state
end

function new_game()
  -- Reset the global `Game` object with defaults
  Game = {
    state = States.Manager:new(),
    search = Threads.Search:new(),
    wordbase = Wordbase.Wordbase:new(),
    datamuse = Threads.Datamuse:new(),
    audiomanager = AudioManager:new(),
    time = Sim.Time:new(),
    news = News:new(),
    player = Player:new(),
    day_gross = {},
    day_loss = {},
    day_net = {}
  }

  for i=1,Config.TotalDays do
    Game.day_gross[i] = 0.0
    Game.day_loss[i] = 0.0
    Game.day_net[i] = 0.0
  end

  Game.audiomanager.currentmusic = chance.helpers.pick({'a','b','c'})
  Game.audiomanager:new_music({fadein=true})

  Game.datamuse:load_cache()
  Game.datamuse:start()

  Game.world = Sim.World:new()

  -- Fill game states
  Game.state:add(States.StateSplash:new())
  --Game.state:add(States.StateIntro:new())
  --Game.state:add(States.StateMenu:new())
  --Game.state:add(States.StateGameplay:new())
  --Game.state:add(States.StateEnding:new())
  --Game.state:add(States.StateDebounce:new())

  -- Start the game
  Game.state:jump('Splash')
  -- Immediately debounce
  Game.state:call('Debounce')

end

-- tear down game objects
function end_game()
  Game.datamuse:dump_cache()
  Game.audiomanager.currentmusic = 'off'
  Game.audiomanager:new_music()
  Game = nil
end

-- Callback for scroll wheel
function love.wheelmoved(x, y)
  if Game and Game.state then
    Game.state:add_scroll(y)
  end
end
