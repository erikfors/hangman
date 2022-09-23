part of 'hangman_animation_bloc.dart';

abstract class HangmanAnimationEvent extends Equatable {
  const HangmanAnimationEvent();

  @override
  List<Object> get props => [];
}

class HangmanAnimationStarted extends HangmanAnimationEvent {}

class HangmanAnimationEnded extends HangmanAnimationEvent {}
