local Lines = class('Lines')
Lines.vert = '│'
Lines.horiz = '─'
Lines.ul = '┌'
Lines.ur = '┐'
Lines.ll = '└'
Lines.lr = '┘'

function Lines.static.draw_vert(x, y1, y2)
  for i=math.min(y1,y2), math.max(y1,y2) do
    love.graphics.print(Lines.vert, screen.topixels(x,i))
  end
end

function Lines.static.draw_horiz(y, x1, x2)
  for i=math.min(x1,x2), math.max(x1,x2) do
    love.graphics.print(Lines.horiz, screen.topixels(i,y))
  end
end

function Lines.static.draw_ll(x, y)
  love.graphics.print(Lines.ll, screen.topixels(x,y))
end

function Lines.static.draw_lr(x, y)
  love.graphics.print(Lines.lr, screen.topixels(x,y))
end

return Lines
