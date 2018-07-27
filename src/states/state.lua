local State = class('State')

function State:initialize(id)--, update_fn, draw_fn)
    self.id = id or ""
    self.do_input = true
--    self.update = update_fn
  --  self.draw = draw_fn
end

function State:enter()
end

function State:exit()
end


function State:update(dt)
  if self.input and self.do_input then
    self.input:update(dt)
  end
end

function State:draw()
end

function State:add_scroll(y)
end

return State
