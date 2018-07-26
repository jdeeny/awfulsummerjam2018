require "src.requires"


function love.load()
  math.randomseed(os.time())
  for i=1,1000 do
    math.random()
  end
  Text.setup_font()
  new_game()
end

function love.update(dt)
  flux.update(dt) -- Update all tweens
  Game.state:update(dt)
end

function love.draw()
  Game.state:draw()   -- should draw everything
end

function new_game()
  -- Reset the global `Game` object with defaults
  Game = {
    the_world = Sim.World:new(),
    state = States.Manager:new(),
  }

  -- Fill game states
  Game.state:add(States.StateSplash:new())
  Game.state:add(States.StateIntro:new())
  Game.state:add(States.StateMenu:new())
  Game.state:add(States.StateGameplay:new())
  Game.state:add(States.StateEnding:new())
  Game.state:add(States.StateDebounce:new())

  -- Start the game
  Game.state:jump('Splash')

end
