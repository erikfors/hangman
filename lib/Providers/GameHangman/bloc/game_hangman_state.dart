part of 'game_hangman_bloc.dart';

enum GameHangmanStatus { initial, playing, over }

class GameHangmanState extends Equatable {
  final GameHangmanStatus status;
  final List<String> lettersPlayed;
  final String word;
  final int lives;
  final int needToWin;
  final bool gameWon;
  final bool lastPlayGood;

  const GameHangmanState({
    this.status = GameHangmanStatus.initial,
    this.lettersPlayed = const <String>[],
    this.word = "",
    this.lives = 6,
    this.needToWin = 0,
    this.gameWon = false,
    this.lastPlayGood = false,
  });

  GameHangmanState copyWith({
    GameHangmanStatus? status,
    List<String>? lettersPlayed,
    String? word,
    int? lives,
    int? needToWin,
    bool? gameWon,
    bool? lastPlayGood,
  }) {
    return GameHangmanState(
        status: status ?? this.status,
        lettersPlayed: lettersPlayed ?? this.lettersPlayed,
        word: word ?? this.word,
        lives: lives ?? this.lives,
        needToWin: needToWin ?? this.needToWin,
        gameWon: gameWon ?? this.gameWon,
        lastPlayGood: lastPlayGood ?? this.lastPlayGood);
  }

  @override
  String toString() {
    return '''GameHangmanState { status: $status, lettersPlayed: ${lettersPlayed.toString()}, Word: $word, LiveLeft: $lives,Found: $needToWin, LastPlayAccert: $lastPlayGood, GameWon?: $gameWon}''';
  }

  @override
  List<Object> get props =>
      [status, lettersPlayed, word, lives, needToWin, gameWon, lastPlayGood];
}

class GameHangmanInitial extends GameHangmanState {}
