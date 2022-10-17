part of 'game_hangman_bloc.dart';

abstract class GameHangmanEvent extends Equatable {
  const GameHangmanEvent();

  @override
  List<Object> get props => [];
}

class GameHangmanGameStarted extends GameHangmanEvent{
  final String choosenWord;
  const GameHangmanGameStarted({required this.choosenWord});
}

class GameHangmanPlayLetter extends GameHangmanEvent{
  final String letterPlayed;
  const GameHangmanPlayLetter({required this.letterPlayed});
}
