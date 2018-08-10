--[[
Stack the items horizontally or vertically. Items are always
full size and scrolled if needed.
]]
local Panel = require('src.ui.widgets.base.panel')

local Stack = class('Stack', Panel)

local Defaults = {
  orientation = 'horiz',
}

function Stack:initialize(options)
  Panel.initialize(self, Defaults)
  for k,v in pairs(options or {}) do
    self.options[k] = v
  end
end

function Stack:add(item, n)
  if n then
    table.insert(self.contents, n, item)
  else
    table.insert(self.contents, item)
  end
end

function Stack:_measure(available_w, available_h)
  if self.options.orientation and self.options.orientation == 'vert' then
    local contents_w = self._find_widest()
    local contents_h = self._sum_heights()
  else
    local contents_w = self._sum_widths()
    local contents_h = self._find_tallest()
  end

  local w = self.options.padding.left + self.options.padding.right +
            self.options.margin.left + self.options.padding.right +
            contents_w

  local h = self.options.padding.top + self.options.padding.bottom +
            self.options.margin.top + self.options.margin.bottom +
            contents_h

  -- add up all children

  self.desired_size = { w, h }
  return { w, h }
end

function Panel:_arrange(allowed_w, allowed_h)
  if self.options.orientation and self.options.orientation == 'vert' then
    local contents_w = self._find_widest()
    local contents_h = self._sum_heights()
  else
    local contents_w = self._sum_widths()
    local contents_h = self._find_tallest()
  end

end

return Stack
