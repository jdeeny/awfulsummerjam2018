local Text = class('text')
Text.static.ibmfont = love.graphics.newFont('assets/fonts/Px437_IBM_VGA8.ttf', 16)

function Text.static.setup_font ()
  love.graphics.setFont(Text.ibmfont)
end

function Text.static.center(string_width, area_width)
  return (area_width - string_width) / 2
end

local function comma_value(n) -- credit http://richard.warburton.it
  local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
  return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

function Text.static.dollars(value, width)
  local width = width or 20
  local value = math.floor(value * 100.0 + 0.5) / 100.0
  local abs = math.abs(value)
  local formatted

  if value >= -0.0049 then
    formatted = comma_value(string.format("%.2f", abs or 0.0)) .. " "
  else
    formatted = "(".. comma_value(string.format("%.2f", abs or 0.0))..")"
  end
  return "$"  ..string.rep(' ', width - #formatted - 1)..formatted
end

return Text
