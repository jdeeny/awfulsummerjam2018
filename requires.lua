class = require 'lib/middleclass/middleclass'
http = require 'socket.http'

-- Love2D
require 'love.graphics'

-- General Libraries
json = require 'lib/dkjson/dkjson'        -- JSON lib
pl = require 'pl.import_into'()           -- Penlight utility lib
lru = require 'lib/lua-lru/src/lru/lru'   -- lru cache
flux = require 'lib/flux/flux'            -- tweening

-- Local
words = require 'words'                   -- Working with english words
datamuse = require 'datamuse'             -- Access the Datamuse API
window = require 'window'                 -- Manage and draw Windows
screen = require 'screen'                 -- Manage screen size, scaling
lines = require 'lines'                   -- Line drawing utilities for Windows
