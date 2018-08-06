--[[
'dock' contents to the left/right/top/bottom of the panel

each item has a dock value that says which side it is added to
]]

local Panel = require('src.widgets.base.panel')

local Dock = class('Dock', Panel)

function Dock:initialize()
  Panel.initialize(self)
end

return Dock
