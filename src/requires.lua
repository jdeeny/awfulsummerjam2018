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
chance = require 'lib.chance.chance'          -- Random data generation lib

-- Local
Config = require 'src.config'
Palette = require 'src.palette'               -- a palette to choose from
Sources = require('src.wordbase.sources-cached')
Text = require 'src.text'                     -- font
Screen = require 'src.screen'                 -- Manage screen size, scaling
Loc = Screen.Loc
Dist = Screen.Dist
Line = require 'src.line'                   -- Line drawing utilities for Windows
Sim = require 'src.sim'                -- Simulation stuff
States = require 'src.states'                          -- State Manager
Ui = require 'src.ui'               -- things that are displayed
Widgets = Ui.Widgets
Window = Ui.Window
News = require 'src.news'
Player = require 'src.player'
Wordbase = require 'src.wordbase'
Threads = require 'src.threads'
AudioManager = require 'src.audiomanager'
require 'src.gameloop'
