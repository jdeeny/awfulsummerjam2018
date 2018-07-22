require "src.requires"

local teststr = ""

local datamuse_cache = lru.new(1000)

function love.load()
  teststr = words.test()
  datamuse_cache = lru.new(1000)
  ibmfont = love.graphics.newFont('assets/fonts/PxPlus_IBM_VGA8.ttf', 16)
  love.graphics.setFont(ibmfont)
  test_window = window:new(8,8,10,10)
  window2 = window:new(14, 7, 20, 12)

  states = StateManager:new()
  states:add(StateSplash:new())
  states:add(StateMenu:new())
  states:jump('Splash')

  print(WordGenerator.generate())
end

function love.update(dt)
  flux.update(dt) -- Update all tweens
  states:update(dt)
end

function love.draw()
  love.graphics.print(teststr ,0, 0)
  love.graphics.print("╫╓er", 8, 16*10)
  test_window:draw()
  window2:draw()
  states:draw()
end

function new_game()
end
