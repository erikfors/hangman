import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';
import 'package:hangman/Widgets/GameScreenWidgets/HangmanAnimation/hangman_animation.dart';

class GameScreenBody extends StatelessWidget {
  const GameScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HangmanAnimationBloc()
        ..add(
          HangmanAnimationStarted(),
        ),
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
