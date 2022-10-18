## Hangman App

### User Stories

#### REQUIRED

- [x] Hangman functionaliy
- [x] Show figure
- [x] Add new body part when user miss the letter
- [x] Highlight letters selected
- [x] Get random word each round

#### BONUS

- [ ] Add definition of word after each round
- [x] Track score every time gets a word right
- [x] Use Bloc.
- [ ] Save highest record
- [ ] List of all past games with words and definitions
- [ ] Improved the user interface by experimenting with styling and coloring.
- [ ] Improved hangman design.
- [x] Highlight green when good letter, red when a bad letter
- [ ] Show history of game with words and their definitions
- [ ] Add extra difficult adding a timer
- [ ] Add full sentences as another game mode
- [ ] Different language mode
- [ ] Add music and effects
- [ ] Monetize it
- [ ] Put in play store, and apple if cheap, hosted on a website

### App Walkthough GIF

<img src="app_walkthrough.gif" width=250><br>

### Notes

-App uses Flutter, and Dart

## Open-source libraries used

* [DIO](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc. (use for http processing)
* [Flutter_Bloc](https://pub.dev/packages/flutter_bloc) - Widgets that make it easy to integrate blocs and cubits into Flutter. Built to work with package:bloc. (state managment solution)
* [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in Dart often involves having to override the == operator as well as hashCode. (To compare classes, reduces boilerplate code)
* [Beamer](https://pub.dev/packages/beamer) - Beamer uses the power of Router and implements all the underlying logic for you, letting you explore arbitrarily complex navigation scenarios with ease.
* [intl](https://pub.dev/packages/intl) - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
