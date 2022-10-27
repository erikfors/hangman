part of 'game_hangman_bloc.dart';

abstract class GameHangmanEvent extends Equatable {
  const GameHangmanEvent();

  @override
  List<Object> get props => [];
}

class GameHangmanGameStarted extends GameHangmanEvent {
  const GameHangmanGameStarted();
}

class GameHangmanPlayLetter extends GameHangmanEvent {
  final String letterPlayed;
  const GameHangmanPlayLetter({required this.letterPlayed});
}

class GameHangmanGameOver extends GameHangmanEvent {}

class GameHangmanGameContinue extends GameHangmanEvent {
  const GameHangmanGameContinue();
}
