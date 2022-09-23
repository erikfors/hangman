part of 'hangman_animation_bloc.dart';

abstract class HangmanAnimationState extends Equatable {
  final bool isActive;
  const HangmanAnimationState(this.isActive);
  
  @override
  List<Object> get props => [isActive];
}

class HangmanAnimationInProgress extends HangmanAnimationState {
  const HangmanAnimationInProgress(super.isActive);
}

