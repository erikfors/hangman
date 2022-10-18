import 'package:flutter/material.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';

class MainOverScreen extends StatelessWidget {
  final GameHangmanState gameState;
  const MainOverScreen(this.gameState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Total Score: ${gameState.totalScore}",
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gameState.gameWon ? "You Win" : "You Lost",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gameState.word,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "A Word deffinition",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        !gameState.gameWon
            ? ElevatedButton(
                onPressed: () {},
                child: const Text("Try Again"),
              )
            : ElevatedButton(
                onPressed: () {},
                child: const Text("Next Word!"),
              ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            !gameState.gameWon ? "Exit" : "Save and Exit",
          ),
        ),
      ],
    );
  }
}
