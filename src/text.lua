local Text = class('text')
  Text.static.ibmfont = love.graphics.newFont('assets/fonts/Px437_IBM_VGA8.ttf', 16)

  function Text.static.setup_font ()
    love.graphics.setFont(Text.ibmfont)
  end

  function Text.static.center(string_width, area_width)
    return (area_width - string_width) / 2
  end

return Text
