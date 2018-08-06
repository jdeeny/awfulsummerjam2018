local Screen = class('Screen')

Screen.char_width = 8
Screen.char_height = 16

-- has an offset of 1 for the characters
function Screen.to_px_span(x, y)
  local x, y = x or 0, y or 0
  return x * (Screen.char_width), y * (Screen.char_height)
end

function Screen.to_px_loc(x, y)
  local x, y = x or 1, y or 1
  return (x - 1) * (Screen.char_width), (y-1) * (Screen.char_height)
end

function Screen.to_ch_span(x, y)
  local x, y = x or 0, y or 0
  return math.floor(x / Screen.char_width), math.floor(y / Screen.char_height)
end

function Screen.to_ch_loc(x, y)
  local x, y = x or 0, y or 0
  return math.floor(x / Screen.char_width) + 1, math.floor(y / Screen.char_height) + 1
end


--[[function Screen.tocharsremainder(x, y)
  return (x % Screen.char_width, y % Screen.char_height)
end]]

return Screen
