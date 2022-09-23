import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hangman_animation_event.dart';
part 'hangman_animation_state.dart';

class HangmanAnimationBloc
    extends Bloc<HangmanAnimationEvent, HangmanAnimationState> {
  HangmanAnimationBloc() : super(const HangmanAnimationInProgress(true)) {
    on<HangmanAnimationStarted>(_onHangmanAnimationStarted);
    on<HangmanAnimationEnded>(_onHangmanAnimationEnded);
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
