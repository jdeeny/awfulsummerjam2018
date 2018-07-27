local Manager = class('StateManager')

function Manager:initialize()
  self.StateList = {}
  self.stack = {}
end

function Manager:add(state)
  if state and state.id then
    print("Adding "..state.id)
    self.StateList[state.id] = state
  end
end

function Manager:jump(state)
  if state and self.StateList[state] then
    print("jumpto " .. state)
    if self.current then self.StateList[self.current]:exit() end
    self.current = state
    --print(pl.pretty.dump(self.StateList[self.current]))
    self.StateList[self.current]:enter()
    self.stack = { self.current }
  end
end

function Manager:call(state)
  if state and self.StateList[state] then
    print("call into ".. state)
    self.StateList[self.current].do_input = false
    table.insert(self.stack, 1, state)
    self.current = state
    self.StateList[self.current]:enter()
  end
end

function Manager:ret()
    if table.getn(self.stack) > 0 then
      table.remove(self.stack, 1)
      self.current = self.stack[1]
      print("ret to " .. self.current)
      self.StateList[self.current].do_input = true
    else
      print("ret tried to pop empty stack, panic with newgame")
      new_game()
    end
end


function Manager:remove()
  if #self.id > 0 then
    self.StateList.remove(self.id)
  end
end

function Manager:update(dt)
  for _,v in ipairs(self.stack) do
    self.StateList[v]:update(dt)
  end
end

function Manager:draw()
  for _,v in ipairs(self.stack) do
    self.StateList[v]:draw()
  end
end

function Manager:add_scroll(y)
  self.StateList[self.stack[1]]:add_scroll(y)
end

return Manager
