require "requires"

local teststr = ""

local datamuse_cache = lru.new(1000)

function love.load()
  teststr = words.test()
  datamuse_cache = lru.new(1000)
end

function love.update(dt)
end

function love.draw()
  love.graphics.print(teststr ,0, 0)
end

function new_game()
end
