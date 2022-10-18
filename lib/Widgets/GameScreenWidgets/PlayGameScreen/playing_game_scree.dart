import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/PlayGameScreen/random_word.dart';

import '../../../Models/alphabet.dart';
import '../../../Providers/GameHangman/bloc/game_hangman_bloc.dart';
import '../../../Providers/RandomWordsProvider/bloc/random_words_bloc.dart';
import '../HangmanAnimation/hangman_animation.dart';
import 'keyboard.dart';

class PlayingGameWidget extends StatelessWidget {
  final GameHangmanState state;
  const PlayingGameWidget(
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Score: ${state.currentScore}",
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const HangmanAnimation(),
        Text("${state.lives} lives left"),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<RandomWordsBloc, RandomWordsState>(
          builder: (context, state) {
            switch (state.status) {
              case RandomWordsStatus.initial:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RandomWordsStatus.success:
                context
                    .read<GameHangmanBloc>()
                    .add(GameHangmanGameStarted(choosenWord: state.word));
                return RandomWord(state.word);
              case RandomWordsStatus.failure:
                return const Text("Failed to get word");
            }
          },
        ),
        const SizedBox(
          height: 30,
        ),
        GameKeyboard(
          Alphabet.includeAll(),
          state.lettersPlayed,
          state.word,
        ),
      ],
    );
  }
}
