local CalendarPanel = class('CalendarPanel', Panel)

function CalendarPanel:initialize(x, y, w, h, xoff, yoff)
  Widgets.Panel.initialize(self, x, y, w, h, xoff, yoff)
end

return CalendarPanel
