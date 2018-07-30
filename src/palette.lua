local Palette = {
  ['Violet'] = { 0x14, 0x0C, 0x1C, 0xFF },
  ['Wine'] = { 0x44, 0x24, 0x34, 0xFF },
  ['Blue'] = { 0x30, 0x34, 0x6D, 0xFF },
  ['LightViolet'] = { 0x4E, 0x4A, 0x4F, 0xFF },
  ['Brown'] = { 0x85, 0x4C, 0x30, 0xFF },
  ['Green'] = { 0x34, 0x65, 0x24, 0xFF },
  ['Red'] = { 0xD0, 0x46, 0x48, 0xFF },
  ['Grey'] = { 0x75, 0x71, 0x61, 0xFF },
  ['LightBlue'] = { 0x59, 0x7D, 0xCE, 0xFF },
  ['Orange'] = { 0xD2, 0x7D, 0x2C, 0xFF },
  ['SteelBlue'] = { 0x85, 0x95, 0xA1, 0xFF },
  ['DarkGreen'] = { 0x6D, 0xAA, 0x2C, 0xFF },
  ['Salmon'] = { 0xD2, 0xAA, 0x99, 0xFF },
  ['AquaBlue'] = { 0x6D, 0xC2, 0xCA, 0xFF },
  ['Yellow'] = { 0xDA, 0xD4, 0x5E, 0xFF },
  ['White'] = { 0xDE, 0xEE, 0xD6, 0xFF },
  ['PureWhite'] = { 0xFF, 0xFF, 0xFF, 0xFF },      -- Pure white/black aren't in the palette but are useful
  ['PureBlack'] = { 0,0,0,0xFF },
  ['Clear'] = { 0,0,0,0 },
}

Palette['NormalText'] = Palette['SteelBlue']
Palette.HighlightText = Palette['White']
Palette['Frame'] = Palette['Grey']
Palette['Heading'] = Palette['Yellow']
Palette['Background'] = Palette['Black']

Palette['HoverFrame'] = Palette['SteelBlue']
Palette['ClickFrame'] = Palette['LightViolet']

Palette.NormalEvent = Palette.Frame
Palette.RelatedEvent = Palette.NormalText
Palette.DirectEvent = Palette.Yellow
Palette.MilestoneEvent = Palette.AquaBlue
Palette.Important = Palette.White

Palette.MoneyBad = Palette.Red
Palette.MoneyGood = Palette.DarkGreen
Palette.MoneyNeutral = Palette.NormalText

return Palette


--[[ DB16
140C1C --Violet
442434 -- Wine
30346D -- Blue
4E4A4F -- muted Violet
854C30 -- brown
346524  -- sage green
D04648 -- red
757161 -- flint grey
597DCE -- light blue
D27D2C -- Orange
8595A1 -- steel blue
6DAA2C -- green
D2AA99 -- salmon
6DC2CA -- aqua blue
DAD45E -- yellow
DEEED6 -- slightest green
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
