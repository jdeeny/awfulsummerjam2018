local Widgets = {}
Widget = require('src.widgets.base.widget')
Widgets.Widget = Widget
Widgets.Panel = require('src.widgets.base.panel')


Widgets.Button = require('src.widgets.button')
Widgets.Slider = require('src.widgets.slider')
Widgets.TextPanel = require('src.widgets.textpanel')
Widgets.List = require('src.widgets.list')
Widgets.Heading = require('src.widgets.heading')
Widgets.ScrollPanel = require('src.widgets.scrollpanel')
Widgets.Dialog = require('src.widgets.dialog')

Widgets.MoneyInfo = require('src.widgets.extra.moneyinfo')
Widgets.PercentInfo = require('src.widgets.extra.percentinfo')
Widgets.ProfitBar = require('src.widgets.extra.profitbar')
Widgets.ProfitGraph = require('src.widgets.extra.profitgraph')
Widgets.ProjectBars = require('src.widgets.extra.projectbars')
Widgets.NewsFeed = require('src.widgets.extra.newsfeed')
Widgets.CalendarPanel = require('src.widgets.extra.calendarpanel')
Widgets.BoxOfficePanel = require('src.widgets.extra.boxofficepanel')
Widgets.PersonInfo = require('src.widgets.extra.personinfo')
Widgets.MovieInfo = require('src.widgets.extra.movieinfo')

Widgets.Columns = require('src.widgets.layout.columns')

Widgets.FilmPage = require('src.widgets.pages.filmpage')
Widgets.ProjectPage = require('src.widgets.pages.projectpage')
Widgets.StatusPage = require('src.widgets.pages.statuspage')
Widgets.IntroPage = require('src.widgets.pages.intropage')
Widgets.SurveyPage = require('src.widgets.pages.surveypage')
Widgets.PersonPage = require('src.widgets.pages.personpage')

return Widgets
