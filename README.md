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
      Lead, support, director
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
