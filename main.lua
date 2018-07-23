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
  ibmfont = love.graphics.newFont('assets/fonts/Px437_IBM_VGA8.ttf', 16)
  love.graphics.setFont(ibmfont)
  test_window = Widgets.Page:new(100,30,10,10, {20,20,20,255})
  window2 = Widgets.Page:new(14, 7, 20, 12, {80,80,80,255})
  panel_test = Widgets.Panel:new(2,2,4,6, {0,40,80,255})
  test_window:add(panel_test)

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
  love.graphics.print("╫╓er -- 1234567890 Teach One BBS Upload | !", 8, 16*20)
  test_window:draw()
  window2:draw()
  states:draw()
end

function new_game()
end
