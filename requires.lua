http = require 'socket.http'
require 'love.graphics'

class = require 'lib/middleclass/middleclass'

--json = require 'lib/json/json'
json = require 'lib/dkjson/dkjson'
pl = require 'pl.import_into'()

lru = require 'lib/lua-lru/src/lru/lru'
words = require 'words'
datamuse = require 'datamuse'
