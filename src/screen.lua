local Screen = class('Screen')

Screen.char_width = 8
Screen.char_height = 16

function Screen.topixels(x, y)
  return x * Screen.char_width, y * Screen.char_height
end

function Screen.tochars(x, y)
  return int(x / Screen.char_width), int(y / Screen.char_height)
end

function Screen.tocharsremainder(x, y)
  return x % Screen.char_width, y % Screen.char_height
end

return Screen
