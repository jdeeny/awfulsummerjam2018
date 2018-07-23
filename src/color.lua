local Color = class('Color')

local Palette = {}

--[[ DB16
140C1C
442434
30346D
4E4A4F
854C30
346524
D04648
757161
597DCE
D27D2C
8595A1
6DAA2C
D2AA99
6DC2CA
DAD45E
DEEED6
]]

--[[ DB32
000000  -- Black
222034  -- SteelGray
45283C  -- DarkViolet
663931  -- Plum
8F563B  -- Clay
DF7126  -- Cinnamon
D9A066  --
EEC39A
FBF236
99E550
6ABE30
37946E
4B692F
524B24
323C39
3F3F74
306082
5B6EE1
639BFF
5FCDE4
CBDBFC
FFFFFF
9BADB7
847E87
696A6A
595652
76428A
AC3232
D95763
D77BBA
8F974A
8A6F30
]]

Palette['Black'] = { color=0, darker='Black', lighter='Grey' }
--[[ Palette['Blue'] = { color: 0, darker: 'Black', lighter: 'BrightBlue' }
Palette['Green'] = { color: 0, darker: 'Black', lighter: 'BrightGreen' }
Palette['Cyan'] = { color: 0, darker: 'Black', lighter: 'BrightCyan' }
Palette['Red'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['Magenta'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['Brown'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['Gray'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['DarkGray'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['BrightBlue'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['BrightGreen'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['BrightCyan'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['BrightRed'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['BrightMagenta'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['Yellow'] = { color: 0, darker: 'Black', lighter: 'Grey' }
Palette['White'] = { color: 0, darker: 'Black', lighter: 'Grey' }
]]

Color.Palette = Palette


return Color
