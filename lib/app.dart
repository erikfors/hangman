import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hangman/Screens/game_screen.dart';
import 'package:hangman/Screens/home_screen.dart';

import 'Theme/app_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: myRoutes,
      theme: MyTheme().theme,
    );
  }

  final myRoutes = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => const HomeScreen(),
        '/game': (context, state, data) => const GameScreen(),        
      },
    ),
  );
}
