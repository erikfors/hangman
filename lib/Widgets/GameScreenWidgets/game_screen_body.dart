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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Score: 18",
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const HangmanAnimation(),
              const Text("6 lives left"),
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
              GameKeyboard(Alphabet.includeAll()),
              // ElevatedButton(
              //     onPressed: () {
              //       context
              //           .read<HangmanAnimationBloc>()
              //           .add(HangmanAnimationStarted());
              //     },
              //     child: const Text("Trigger"))
            ],
          );
        },
      ),
    );
  }
}
