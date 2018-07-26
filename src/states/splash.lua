local State = require('src.states.state')
local StateSplash = class("StateSplash", State)

function StateSplash:initialize()
  States.State.initialize(self, 'Splash')
  self.input = baton.new(Config.Controls)

end


function StateSplash:update(dt)
  State.update(self, dt)

  if self.input:pressed('continue') then
    Game.state:jump('Intro')
    print("!")
    Game.state:call('Debounce')
  end
end

function StateSplash:draw()
  Palette.Orange:set()
  local x, y = Screen.topixels(Text.center(83, Config.CharWidth),
                                Text.center(6, Config.CharHeight))

  love.graphics.print([[
  .d8b.  d8888b. d88888b d8888b. d888888b  .d88b.  db       .d88b.   d888b  db    db
 d8' `8b 88  `8D 88'     88  `8D   `88'   .8P  Y8. 88      .8P  Y8. 88' Y8b `8b  d8'
 88ooo88 88oodD' 88ooooo 88oobY'    88    88    88 88      88    88 88       `8bd8'
 88~~~88 88~~~   88~~~~~ 88`8b      88    88    88 88      88    88 88  ooo    88
 88   88 88      88.     88 `88.   .88.   `8b  d8' 88booo. `8b  d8' 88. ~8~    88
 YP   YP 88      Y88888P 88   YD Y888888P  `Y88P'  Y88888P  `Y88P'   Y888P     YP
]], x, y)
end

return StateSplash
