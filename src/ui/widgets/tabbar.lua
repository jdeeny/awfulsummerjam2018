local TabBar = class('TabBar', Widget)

function TabBar:initialize(options)
  Widget.initialize(self, options)
  self.tabs = self.options.tabs or {}
  self.selected = self.options.selected or self.tabs[1] or ''
end

function TabBar:update(dt)
  Widget.update(self, dt)
end

function TabBar:draw()
end

return TabBar
