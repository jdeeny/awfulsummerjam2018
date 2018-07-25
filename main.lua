require "src.requires"


function love.load()
  math.randomseed(os.time())
  Text.setup_font()
  new_game()
end

function love.update(dt)
  --flux.update(dt) -- Update all tweens
  --Game.state:update(dt)
end

function love.draw()
  Palette.Orange:set()
  love.graphics.print("teststr" ,0, 0)
  love.graphics.print("╫╓er -- 1234567890 Teach One BBS Upload | !", 8, 16*20)
  --test_window:draw()
  --window2:draw()
  for i,v in ipairs(w) do
    v:draw()
  end
  --Game.state:draw()   -- should draw everything
end

function new_game()

  -- Reset the global `Game` object with defaults
  Game = {
    player_input = init_controls(),
    the_world = Sim.World:new(),
    state = States.Manager:new(),
  }

  -- Fill game states
  Game.state:add(States.StateSplash:new())
  Game.state:add(States.StateMenu:new())
  Game.state:jump('Splash')

  -- Make some text windows
  w = {
    Widgets.Page:new(5, 10, 5, 10, Palette.Violet),
    Widgets.Page:new(25, 20, 25, 10, Palette.Red),
    Widgets.Page:new(45, 410, 5, 10, Palette.Green),
  }
--[[  teststr = words.test()
  datamuse_cache = lru.new(1000)
  ibmfont = love.graphics.newFont('assets/fonts/Px437_IBM_VGA8.ttf', 16)
  love.graphics.setFont(ibmfont)
]]
  test_window = Widgets.Page:new(100,30,10,10, {20,20,20,255})
  window2 = Widgets.Page:new(14, 7, 20, 12, {80,80,80,255})
  panel_test = Widgets.Panel:new(2,2,4,6, {0,40,80,255})
  test_window:add(panel_test)
--]]


  -- print(pl.pretty.dump(the_world))
end
