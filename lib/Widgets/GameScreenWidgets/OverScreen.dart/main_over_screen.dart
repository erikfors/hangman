import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Providers/WordDefinitionProvider/bloc/word_definition_bloc.dart';

class MainOverScreen extends StatelessWidget {
  final GameHangmanState gameState;
  const MainOverScreen(this.gameState, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordDefinitionBloc(gameState.word)
        ..add(
          WordDefinitionFetched(),
        ),
      child: Column(
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
          BlocBuilder<WordDefinitionBloc, WordDefinitionState>(
            builder: (context, state) {
              switch (state.status) {
                case WordDefinitionStatus.initial:
                  return Text(
                    "Getting your definition...",
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                case WordDefinitionStatus.success:
                  List<Widget> definitionsWidgets = [];
                  for (int i = 1; i <= state.definitions.length; i++) {
                    definitionsWidgets
                        .add(Text("$i- ${state.definitions[i - 1]}"));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...definitionsWidgets,
                    ],
                  );
                case WordDefinitionStatus.failure:
                  return Text(
                    "Could not get definition :(",
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          !gameState.gameWon
              ? ElevatedButton(
                  onPressed: () {
                    //TODO save game

                    //TODO start game over
                    context
                        .read<GameHangmanBloc>()
                        .add(const GameHangmanGameStarted());
                    context
                        .read<HangmanAnimationBloc>()
                        .add(HangmanAnimationStarted());
                  },
                  child: const Text("Try Again"),
                )
              : ElevatedButton(
                  onPressed: () {
                    //TODO save first

                    //TODO start with another word
                  },
                  child: const Text("Next Word!"),
                ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              //TODO Do the saving part
              Beamer.of(context).beamBack();
            },
            child: Text(
              !gameState.gameWon ? "Exit" : "Save and Exit",
            ),
          ),
        ],
      ),
    );
  }
}
