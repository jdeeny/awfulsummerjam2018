require "requires"

local teststr = ""

local datamuse_cache = lru.new(1000)

function love.load()
  teststr = words.test()
  datamuse_cache = lru.new(1000)
  ibmfont = love.graphics.newFont('assets/fonts/PxPlus_IBM_VGA8.ttf', 16)
  love.graphics.setFont(ibmfont)
end

function love.update(dt)
end

function love.draw()
  love.graphics.print(teststr ,0, 0)
  love.graphics.print("╫╓er", 8, 16*10)
end

function new_game()
end
