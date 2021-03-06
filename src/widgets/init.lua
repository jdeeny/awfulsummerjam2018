local Widgets = {}
Widget = require('src.widgets.widget')
Widgets.Widget = Widget

Widgets.Button = require('src.widgets.button')

Widgets.Panel = require('src.widgets.panel')
Widgets.Slider = require('src.widgets.slider')
Widgets.TextPanel = require('src.widgets.textpanel')
Widgets.CalendarPanel = require('src.widgets.calendarpanel')
Widgets.MoneyInfo = require('src.widgets.moneyinfo')
Widgets.PercentInfo = require('src.widgets.percentinfo')
Widgets.PersonInfo = require('src.widgets.personinfo')
Widgets.MovieInfo = require('src.widgets.movieinfo')
Widgets.List = require('src.widgets.list')
Widgets.BoxOfficePanel = require('src.widgets.boxofficepanel')
Widgets.Heading = require('src.widgets.heading')
Widgets.ScrollPanel = require('src.widgets.scrollpanel')
Widgets.ProfitBar = require('src.widgets.profitbar')
Widgets.ProfitGraph = require('src.widgets.profitgraph')
Widgets.ProjectBars = require('src.widgets.projectbars')
Widgets.NewsFeed = require('src.widgets.newsfeed')

Widgets.FilmPage = require('src.widgets.pages.filmpage')
Widgets.ProjectPage = require('src.widgets.pages.projectpage')
Widgets.StatusPage = require('src.widgets.pages.statuspage')
Widgets.IntroPage = require('src.widgets.pages.intropage')
Widgets.SurveyPage = require('src.widgets.pages.surveypage')
Widgets.PersonPage = require('src.widgets.pages.personpage')

return Widgets
