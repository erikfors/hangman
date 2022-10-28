import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/OverScreen.dart/main_over_screen.dart';
import 'package:hangman/Widgets/GameScreenWidgets/PlayGameScreen/playing_game_scree.dart';

class GameScreenBody extends StatelessWidget {
  const GameScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HangmanAnimationBloc()),
        BlocProvider(
          create: (_) => GameHangmanBloc(),
        ),
      ],
      child: BlocBuilder<HangmanAnimationBloc, HangmanAnimationState>(
        builder: (context, state) {
          return BlocBuilder<GameHangmanBloc, GameHangmanState>(
            builder: (context, state) {
              if (!state.lastPlayGood) {
                context
                    .read<HangmanAnimationBloc>()
                    .add(HangmanAnimationStarted());
              }
              switch (state.status) {
                case GameHangmanStatus.initial:
                  context
                      .read<GameHangmanBloc>()
                      .add(const GameHangmanGameStarted());
                  return PlayingGameWidget(state);
                case GameHangmanStatus.playing:
                  if (state.lives > 0 && !state.gameWon) {
                    return PlayingGameWidget(state);
                  } else {
                    Future.delayed(
                      const Duration(seconds: 2),
                      (() => context.read<GameHangmanBloc>().add(
                            GameHangmanGameOver(),
                          )),
                    );
                    return PlayingGameWidget(state);
                  }
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
