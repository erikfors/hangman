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
  final int currentScore;
  final int totalScore;

  const GameHangmanState({
    this.status = GameHangmanStatus.initial,
    this.lettersPlayed = const <String>[],
    this.word = "",
    this.lives = 6,
    this.needToWin = 0,
    this.gameWon = false,
    this.lastPlayGood = false,
    this.currentScore = 0,
    this.totalScore = 0,
  });

  GameHangmanState copyWith({
    GameHangmanStatus? status,
    List<String>? lettersPlayed,
    String? word,
    int? lives,
    int? needToWin,
    bool? gameWon,
    bool? lastPlayGood,
    int? currentScore,
    int? totalScore,
  }) {
    return GameHangmanState(
        status: status ?? this.status,
        lettersPlayed: lettersPlayed ?? this.lettersPlayed,
        word: word ?? this.word,
        lives: lives ?? this.lives,
        needToWin: needToWin ?? this.needToWin,
        gameWon: gameWon ?? this.gameWon,
        lastPlayGood: lastPlayGood ?? this.lastPlayGood,
        currentScore: currentScore ?? this.currentScore,
        totalScore: totalScore ?? this.totalScore);
  }

  @override
  String toString() {
    return '''GameHangmanState { Status: $status, LettersPlayed: ${lettersPlayed.toString()}, Word: $word, LiveLeft: $lives,Found: $needToWin, LastPlayAccert: $lastPlayGood, GameWon?: $gameWon, CurrentPoints: $currentScore, TotalPoints: $totalScore}''';
  }

  @override
  List<Object> get props => [
        status,
        lettersPlayed,
        word,
        lives,
        needToWin,
        gameWon,
        lastPlayGood,
        currentScore,
        totalScore,
      ];
}

class GameHangmanInitial extends GameHangmanState {}
