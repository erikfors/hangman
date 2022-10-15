import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Models/alphabet.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Providers/RandomWordsProvider/bloc/random_words_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/HangmanAnimation/hangman_animation.dart';
import 'package:hangman/Widgets/GameScreenWidgets/keyboard.dart';
import 'package:hangman/Widgets/GameScreenWidgets/random_word.dart';

class GameScreenBody extends StatelessWidget {
  const GameScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HangmanAnimationBloc()
            ..add(
              HangmanAnimationStarted(),
            ),
        ),
        BlocProvider(
          create: (_) => RandomWordsBloc()..add(RandomWordFetched()),
        ),
        BlocProvider(
          create: (_) => GameHangmanBloc(),
        ),
      ],
      child: BlocBuilder<HangmanAnimationBloc, HangmanAnimationState>(
        builder: (context, state) {
          return BlocBuilder<GameHangmanBloc, GameHangmanState>(
            builder: (context, state) {
              if ((state.status == GameHangmanStatus.playing &&
                      !state.lastPlayGood) ||
                  state.status == GameHangmanStatus.over) {
                context
                    .read<HangmanAnimationBloc>()
                    .add(HangmanAnimationStarted());
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Score: 0 (To Do)",
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
                          context.read<GameHangmanBloc>().add(
                              GameHangmanGameStarted(choosenWord: state.word));
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
            },
          );
        },
      ),
    );
  }
}
