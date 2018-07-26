local Screen = class('Screen')

Screen.char_width = 8
Screen.char_height = 16

-- has an offset of 1 for the characters
function Screen.topixels(x, y)
  return x * (Screen.char_width-1), y * (Screen.char_height-1)
end

function Screen.tochars(x, y)
  return int(x / Screen.char_width)+1, int(y / Screen.char_height)+1
end

--[[function Screen.tocharsremainder(x, y)
  return (x % Screen.char_width, y % Screen.char_height)
end]]

return Screen
