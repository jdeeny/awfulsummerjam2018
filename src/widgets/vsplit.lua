local VSplit = class('Vsplit', Widget)

function VSplit:initialize(x,y,w,h,n)
  Widget.initialize(self,x,y,w,h)
  self.colsplit = 2
  self.colw = math.floor(w / n) - colsplit
  self.contents[1] = {}
  self.contents[2] = {}
end

function V

return VSplit
