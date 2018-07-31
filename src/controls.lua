local input_config = {
  controls = {
    quit = { 'key:escape', 'key:backspace' },
    continue = { 'key:space', 'key:enter' },
    click = { 'mouse:1' }
  }
}

local anykey = {}
for k,v in pairs(input_config.controls) do
  for _,w in ipairs(v) do
    print(w)
    table.insert(anykey, w)
  end
end
print("---")
print(pl.pretty.dump(anykey))
input_config.controls.anykey = anykey


return input_config
--[[
function init_controls()
  local player_input = baton.new {
    controls = {
      moveleft = {'key:a', 'axis:leftx-', 'button:dpleft'},
      moveright = {'key:d', 'axis:leftx+', 'button:dpright'},
      moveup = {'key:w', 'axis:lefty-', 'button:dpup'},
      movedown = {'key:s', 'axis:lefty+', 'button:dpdown'},

      aimleft = {'key:left', 'axis:rightx-'},
      aimright = {'key:right', 'axis:rightx+'},
      aimup = {'key:up', 'axis:righty-'},
      aimdown = {'key:down', 'axis:righty+'},

      swap = {'key:q', 'button:a'},

      fire = {'mouse:1'},

      pause = {'key:escape', 'button:start'},
      back = {'key:backspace', 'button:b'},
      sel = {'key:space', 'button:a', 'key:return'},
      quit = {'key:q', 'button:back'},
    },
    pairs = {
      move = {'moveleft', 'moveright', 'moveup', 'movedown'},
      aim = {'aimleft', 'aimright', 'aimup', 'aimdown'},
    },
  }

  return player_input
end

function love.joystickadded(j)
  player_input.joystick = j
end

]]
