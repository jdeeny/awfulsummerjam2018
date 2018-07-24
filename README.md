# awfulsummerjam2018

Title: TBA

Concept:
You are a movie studio exec and have been tasked with creating blockbuster
sequels to existing movies. Get advice from your subordinates, conduct surveys,
use focus groups, and examine box office winners and losers in order to create
the very best (grossing) sequel possible!

Look:
Text-mode ANSI graphics look, but taking advantage of the modern environment
that allows smooth scrolling, particle effects, etc.

Audio:
Click sounds
mumbling people, peanuts style
minor explosions, pop type sounds
music - ??


Interface
  The interface is based on a set of pages that take up a large portion of the area
  I think it would be nice to have some things that are always shown
    a clock / calendar
    quick status bar
    buttons to select pages
      We will have plenty of room to have additional stuff, like sparklines
      or status numbers
      Buttons should have on-hover
Pages
  Status
    Current profit/loss, active projects, chart of money stuff
  New Work
    list of possible titles to sequel
    each title has info about the previous movie, actors, gross, themes
  Projects
    See info about the projects you have taken on
    Show grosses, what types of people are going
    Give options to modify the project
    Projects go through 3 phases: preproduction, production, released
    Actions are limited by the phase of the project, you can't change actors in a movie that is released
  Research
    Find out about actors, movies, box office grosses, etc
  Focus Groups
    Ask people what they think


Simulation
  A world is created randomly
    people that have ages, sex, interests, movie-going likelyhood
    actors and directors that are people but have social attributes and movie history
    movies, with a selection of old movies and new, so some can be used for history and providing new work
    projects are movies, but with additional info attached

  Movie generation
    Mad libs of a set of movie title templates
      "The <noun> of <noun>"
      "<word>"
      "The <word>"
      "The <adjective> <noun>"
      etc
    Roles are filled with people
      Lead, support, director, writer
    The words selected are used to select some further words to describe the film
    All the words are used to match against people's interests

  People generation
    Basically all random
    it would be cool to have some hair/clothes choice

  Movie Attendance
    For each citizen, it decides if they go to all playing movies, based on likes/dislikes

  Rankings
    All movies that are out get ranked by box office, so we can tell the player that
    theirs is #1 or #40

Things the player can do
  change amount of advertising, theme of adverts
  select actors w/ attached salaries
  choose release date
  change writers w/ rewrites
  change directors
  scrap projects
  rename
  change out theme words
  doing things has a cost, in $ and time

  there should be a per-turn time limit
  and doing certain things should take time
  so you could do x things per turn, but if you wait too long you can only do x-1..
  and a movie should have a production time

Queries
  in the background, query for relationships between words
  there can be a priority queue, basically stuff needed now and stuff that can wait
  at a deadline (making player wait too long), it will collapse everything at that
  point, using totally random values if need be
  there is a cache of queries

Word relationships
  Hmm try stuff till it works or doesnt :)

Relationships
  One way?
  They should have a distribution of possible values
  Need to find a way to propogate them
  I think this is a normal technique from ray tracing and has a name like
  probabilistic arithmetic
  or maybe probabilistic logic
