local Manager = class('Manager')

function Manager:initialize()
  self.StateList = {}
  self.current = nil
end

function Manager:add(state)
  if state then
    self.StateList[state.id] = state
  end
end

function Manager:jump(state)
  if state and self.StateList[state] then
    if self.current then self.StateList[self.current]:exit() end
    self.current = state
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
