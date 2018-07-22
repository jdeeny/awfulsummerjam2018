class = require 'lib.middleclass.middleclass'
http = require 'socket.http'

-- Love2D
require 'love.graphics'

-- General Libraries
json = require 'lib.dkjson.dkjson'        -- JSON lib
pl = require 'pl.import_into'()           -- Penlight utility lib
lru = require 'lib.lua-lru.src.lru.lru'   -- lru cache
flux = require 'lib.flux.flux'            -- tweening
baton = require 'lib.baton.baton'         -- input
stack = require 'lib.LuaStackQueue.stack' -- Stack ADT
queue = require 'lib.LuaStackQueue.queue' -- Queue ADT
serpent = require 'lib.serpent.src.serpent'   -- Serpent serialization
chance = require 'lib.chance.chance'          -- Random data generation lib

-- Local
words = require 'src.words'                   -- Working with english words
datamuse = require 'src.datamuse'             -- Access the Datamuse API
window = require 'src.window'                 -- Manage and draw Windows
screen = require 'src.screen'                 -- Manage screen size, scaling
lines = require 'src.lines'                   -- Line drawing utilities for Windows
require 'src.generators'                -- Text generators
require 'src.states'                          -- State Manager
