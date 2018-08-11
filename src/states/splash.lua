local State = require('src.states.state')
local StateSplash = class("StateSplash", State)

local LOGO = [[
 .d8b.  d8888b. d88888b d8888b. d888888b  .d88b.  db       .d88b.   d888b  db    db
d8' `8b 88  `8D 88'     88  `8D   `88'   .8P  Y8. 88      .8P  Y8. 88' Y8b `8b  d8'
88ooo88 88oodD' 88ooooo 88oobY'    88    88    88 88      88    88 88       `8bd8'
88~~~88 88~~~   88~~~~~ 88`8b      88    88    88 88      88    88 88  ooo    88
88   88 88      88.     88 `88.   .88.   `8b  d8' 88booo. `8b  d8' 88. ~8~    88
YP   YP 88      Y88888P 88   YD Y888888P  `Y88P'  Y88888P  `Y88P'   Y888P     YP
]]

local COPYRIGHT = "Copyright (c) 2018 John Deeny, blastron, Noyemi K, Julez Michaud"
local AWFUL = "Awful Summer Jam 2018"

function StateSplash:initialize()
  States.State.initialize(self, 'Splash')
  self.input = baton.new(Config.Controls)

  self.win_logo = Window:new() -- fullscreen
  self.win_logo:add(Widgets.TextPanel:new({ id = 'logo', text = LOGO, color = Palette.Yellow, halign = 'center' }))
  self.win_logo:add(Widgets.TextPanel:new({ id = 'copyright', text = COPYRIGHT, color = Palette.Brown, halign = 'center' }))
  self.win_logo:add(Widgets.TextPanel:new({ id = 'awful', text = AWFUL, color = Palette.Aquablue, halign = 'center' }))

  self.win_logo:constrain('logo', 'above', 'copyright')
  self.win_logo:constrain('copyright', 'above', 'awful')

end


function StateSplash:update(dt)
  State.update(self, dt)

  self.win_logo:update(dt)

  if self.input:down('continue') or self.input:down('quit') then
    Game.state:jump('Intro')
    Game.state:call('Debounce')
  end
end

function StateSplash:draw()
  self.win_logo:draw()
end

return StateSplash
