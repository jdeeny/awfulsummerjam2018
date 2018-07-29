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
end

function News:add(text, kind, options)
  self:_add(text or "Time Passes", kind or 'low', options or {})
end

function News:_add(text, kind, options)
  table.insert(self.events, {text=text,kind=kind,options=options,time=Game.time:now()})
  -- set news ticker unclean
  -- Game.statuspage.n  etc
end

-- emit news n -1 items in the past
function News:emit(n)
  local event = self.events[#events - (n - 1)]
  local c = kind_colors[event.kind] or Palette.NormalText
  return {Game.time:format(event.time).." : " .. event.text, c }
end

return News
