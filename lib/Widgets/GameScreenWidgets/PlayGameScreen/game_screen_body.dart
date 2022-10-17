import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Models/alphabet.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Providers/RandomWordsProvider/bloc/random_words_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/HangmanAnimation/hangman_animation.dart';
import 'package:hangman/Widgets/GameScreenWidgets/OverScreen.dart/main_over_screen.dart';
import 'package:hangman/Widgets/GameScreenWidgets/PlayGameScreen/keyboard.dart';
import 'package:hangman/Widgets/GameScreenWidgets/PlayGameScreen/playing_game_scree.dart';

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
              switch (state.status) {
                case GameHangmanStatus.initial:
                  return PlayingGameWidget(state);
                case GameHangmanStatus.playing:
                  return PlayingGameWidget(state);
                case GameHangmanStatus.over:
                  return MainOverScreen(state);
                default:
                  return const Center(
                    child: Text("Unknown"),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
