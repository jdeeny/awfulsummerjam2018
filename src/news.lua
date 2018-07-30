local News = class('News')

local kind_colors = {
  normal = Palette.NormalEvent,
  related = Palette.RelatedEvent,
  direct =  Palette.DirectEvent,
  milestone = Palette.MilestoneEvent,
  important = Palette.Important,
}

function News:initialize()
  self.events = {}
  self.count = 0
end

function News:add(text, kind, options)
  self.count = self.count + 1
  self:_add(self.count, text or "Time Passes", kind or 'low', options or {})
end

function News:_add(count, text, kind, options)
  self.events[count] = {text=text,kind=kind,options=options,time={Game.time:now()}}
  -- set news ticker unclean
  -- Game.statuspage.n  etc
end

-- emit news n -1 items in the past
function News:emit(n)
  if n < 1 or n > #self.events then return nil end
  local event = self.events[#self.events - (n - 1)]
  local c = kind_colors[event.kind] or Palette.NormalText
  local y,m,d = event.time[1],event.time[2],event.time[3]
  return Sim.Time.format(y,m,d).." : " .. event.text, c
end

return News
