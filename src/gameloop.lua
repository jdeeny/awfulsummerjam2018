-- This is for things that happen exactly once
function love.load()
  math.randomseed(os.time())
  for i=1,100*(1.0 + 2.0 * math.random()) do
    _ = math.random()
  end
  Text.setup_font()

  new_game()
end


function love.update(dt)
  flux.update(dt) -- Update all tweens
  Game.state:update(dt)
  Game.datamuse:update(dt)
end

function love.draw()
  Game.state:draw()   -- should draw everything
end

function new_game()
  -- Reset the global `Game` object with defaults
  Game = {
    state = States.Manager:new(),
    search = Threads.search:new(),
    wordbase = Wordbase.wordbase:new(),
    datamuse = Threads.datamuse:new(),
    --search = Threads.search:new(),
  }

  Game.datamuse:load_cache()
  Game.datamuse:start()

  Game.the_world = Sim.World:new()

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
