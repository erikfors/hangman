import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Providers/RandomWordsProvider/bloc/random_words_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/HangmanAnimation/hangman_animation.dart';
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
      ],
      child: BlocBuilder<HangmanAnimationBloc, HangmanAnimationState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Score: 18",
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const HangmanAnimation(),
              const Text("6 lives left"),
              BlocBuilder<RandomWordsBloc, RandomWordsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case RandomWordsStatus.initial:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case RandomWordsStatus.success:
                      return RandomWord(state.word);
                    case RandomWordsStatus.failure:
                      return const Text("Failed to get word");
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<HangmanAnimationBloc>()
                        .add(HangmanAnimationStarted());
                  },
                  child: const Text("Trigger"))
            ],
          );
        },
      ),
    );
  }
}
