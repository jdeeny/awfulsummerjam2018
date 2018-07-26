local Manager = class('StateManager')

function Manager:initialize()
  self.StateList = {}
  self.stack = nil
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
  end
end

function Manager:remove()
  if #self.id > 0 then
    self.StateList.remove(self.id)
  end
end

function Manager:update(dt)
  if self.current and self.StateList[self.current] then
    self.StateList[self.current]:update(dt)
  end
end

function Manager:draw()
  if self.current and self.StateList[self.current] then
    self.StateList[self.current]:draw()
  end
end

return Manager
