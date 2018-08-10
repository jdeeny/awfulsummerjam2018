local Widgets = {}
Widget = require((...)..'.base.widget')
Widgets.Widget = Widget
Widgets.Panel = require((...)..'.base.panel')
Widgets.Canvas = require((...)..'.panels.canvas')
Widgets.Dock = require((...)..'.panels.dock')
Widgets.Grid = require((...)..'.panels.grid')
Widgets.Stack = require((...)..'.panels.stack')
Widgets.Wrap = require((...)..'.panels.wrap')

Widgets.Button = require((...)..'.button')
Widgets.Slider = require((...)..'.slider')
Widgets.TextPanel = require((...)..'.textpanel')
Widgets.List = require((...)..'.list')
Widgets.Heading = require((...)..'.heading')
Widgets.ScrollPanel = require((...)..'.scrollpanel')
Widgets.Dialog = require((...)..'.dialog')
Widgets.TabBar = require((...)..'.tabbar')

Widgets.MoneyInfo = require((...)..'.extra.moneyinfo')
Widgets.PercentInfo = require((...)..'.extra.percentinfo')
Widgets.ProfitBar = require((...)..'.extra.profitbar')
Widgets.ProfitGraph = require((...)..'.extra.profitgraph')
Widgets.ProjectBars = require((...)..'.extra.projectbars')
Widgets.NewsFeed = require((...)..'.extra.newsfeed')
Widgets.CalendarPanel = require((...)..'.extra.calendarpanel')
Widgets.BoxOfficePanel = require((...)..'.extra.boxofficepanel')
Widgets.PersonInfo = require((...)..'.extra.personinfo')
Widgets.MovieInfo = require((...)..'.extra.movieinfo')

Widgets.FilmPage = require((...)..'.pages.filmpage')
Widgets.ProjectPage = require((...)..'.pages.projectpage')
Widgets.StatusPage = require((...)..'.pages.statuspage')
Widgets.IntroPage = require((...)..'.pages.intropage')
Widgets.SurveyPage = require((...)..'.pages.surveypage')
Widgets.PersonPage = require((...)..'.pages.personpage')

return Widgets
