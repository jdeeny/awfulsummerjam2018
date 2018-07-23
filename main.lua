require "src.requires"

Config = {}
Config.CurrentYear = 1982


local teststr = ""

local datamuse_cache = lru.new(1000)

function love.load()
  math.randomseed(os.time())

  --print(pl.pretty.dump(WordGen.Nouns))
  --print(pl.pretty.dump(WordGen.surnames))

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

  for i=1,10 do
    print(WordGen.Person:new():emit())
  end
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
