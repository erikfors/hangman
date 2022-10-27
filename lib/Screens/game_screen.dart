import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/GameScreenWidgets/PlayGameScreen/game_screen_body.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game screen"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: GameScreenBody(),
      ),
    );
  }
}
