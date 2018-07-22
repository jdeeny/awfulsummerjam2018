local State = class('State')

function State:initialize(id, update_fn, draw_fn)
    self.id = id or ""
    self.update = update_fn
    self.draw = draw_fn
end

function State:enter()
end

function State:exit()
end


function State:update(dt)
end

function State:draw()
end

return State
