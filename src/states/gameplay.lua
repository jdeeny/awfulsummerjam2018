local State = require('src.states.state')
local StateGameplay = class("StateGameplay", State)

function StateGameplay:initialize()
  States.State.initialize(self, 'Gameplay')
  self.input = baton.new(Config.Controls)

end

function StateGameplay:update(dt)
  State.update(self, dt)
  if math.random(60) == 1 then
    if not Game.datamuse.thread:isRunning() then Game.datamuse:start() end
    print("Lookup request")
    print(pl.pretty.dump(Game.datamuse:lookup('ml=duckling')))
    print("Err: " .. (Game.datamuse.thread:getError() or ""))
    print("isrunning: " .. tostring(Game.datamuse.thread:isRunning()))
    print ("---")
  end
  if self.input:pressed('continue') then
    Game.state:jump('Ending')
    Game.state:call('Debounce')
  end
end


function StateGameplay:draw()
  Palette.Wine:set()
  love.graphics.print("Gameplay", 5, 5)
end

return StateGameplay
