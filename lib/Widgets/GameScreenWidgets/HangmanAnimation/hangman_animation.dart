import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../Providers/HangmanAnimationProvider/bloc/hangman_animation_bloc.dart';

class HangmanAnimation extends StatefulWidget {
  const HangmanAnimation({super.key});

  @override
  State<HangmanAnimation> createState() => _HangmanAnimationState();
}

class _HangmanAnimationState extends State<HangmanAnimation> {
  SMIInput<bool>? _trigger;
  Artboard? _hangmanArtboard;

  @override
  void initState() {
    super.initState();

    rootBundle.load("lib/Assets/hangman.riv").then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
        artboard,
        "State Machine 1",
      );
      if (controller != null) {
        artboard.addController(controller);
        _trigger = controller.findInput("Trigger 1");
      }
      setState(() {
        _hangmanArtboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: _hangmanArtboard == null
          ? const SizedBox()
          : BlocBuilder<HangmanAnimationBloc, HangmanAnimationState>(
              builder: (context, state) {
                if (state.isActive) {
                  _triggerAnimation();
                }
                context
                    .read<HangmanAnimationBloc>()
                    .add(HangmanAnimationEnded());

                return Rive(
                  artboard: _hangmanArtboard!,
                );
              },
            ),
    );
  }

  void _triggerAnimation() {
    if (_trigger?.controller.isActive == false) {
      _trigger?.value = true;
    }
  }
}
