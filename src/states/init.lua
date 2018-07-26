local States = {
  Manager = require ('src.states.manager'),
  State = require ('src.states.state'),
  StateSplash = require ('src.states.splash'),
  StateMenu = require ('src.states.menu'),
  StateGameplay = require ('src.states.gameplay'),
  StateEnding = require ('src.states.ending'),
}

return States
