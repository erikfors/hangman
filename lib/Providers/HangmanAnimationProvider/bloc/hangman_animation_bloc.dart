import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:equatable/equatable.dart';

part 'hangman_animation_event.dart';
part 'hangman_animation_state.dart';

const throttleDuration = Duration(milliseconds: 100);

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

  FutureOr<void> _onHangmanAnimationStarted(
      HangmanAnimationStarted event, Emitter<HangmanAnimationState> emit) {
    emit(const HangmanAnimationInProgress(true));
  }

  FutureOr<void> _onHangmanAnimationEnded(
      HangmanAnimationEnded event, Emitter<HangmanAnimationState> emit) {
    emit(const HangmanAnimationInProgress(false));
  }
}
