import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:equatable/equatable.dart';

part 'hangman_animation_event.dart';
part 'hangman_animation_state.dart';

const throttleDuration = Duration(seconds: 1);

class HangmanAnimationBloc
    extends Bloc<HangmanAnimationEvent, HangmanAnimationState> {
  HangmanAnimationBloc() : super(const HangmanAnimationInProgress(true)) {
    on<HangmanAnimationStarted>(
      _onHangmanAnimationStarted,
      transformer: throttle(throttleDuration),
    );
    on<HangmanAnimationEnded>(
      _onHangmanAnimationEnded,
      transformer: throttle(throttleDuration),
    );
  }

  void _onHangmanAnimationStarted(
      HangmanAnimationStarted event, Emitter<HangmanAnimationState> emit) {
    emit( const HangmanAnimationInProgress(true));
  }

  void _onHangmanAnimationEnded(
      HangmanAnimationEnded event, Emitter<HangmanAnimationState> emit) {
    return emit(const HangmanAnimationInProgress(false));
  }
}
