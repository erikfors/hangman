import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:equatable/equatable.dart';

import '../../../Logic/Requests/random_word_request.dart';

part 'game_hangman_event.dart';
part 'game_hangman_state.dart';

const throttleDuration = Duration(seconds: 1);

class GameHangmanBloc extends Bloc<GameHangmanEvent, GameHangmanState> {
  GameHangmanBloc() : super(GameHangmanInitial()) {
    on<GameHangmanGameStarted>(_onGameHangmanGameStarted);
    on<GameHangmanPlayLetter>(_onGameHangmanPlayLetter,
        transformer: throttle(throttleDuration));
    on<GameHangmanGameOver>(_onGameHangmanOver);
  }

  void _onGameHangmanGameStarted(
      GameHangmanGameStarted event, Emitter<GameHangmanState> emit) async {
    final randomWord = await RandomWordRequest.getRandomWord();

    if (state.status == GameHangmanStatus.initial) {
      return emit(state.copyWith(
          status: GameHangmanStatus.playing, word: randomWord.toUpperCase()));
    } else if (state.status == GameHangmanStatus.over) {
      if (state.gameWon == false) {
        return emit(state.copyWith(
          status: GameHangmanStatus.playing,
          word: randomWord.toUpperCase(),
          currentScore: 0,
          lettersPlayed: List.empty(),
          lives: 6,
          needToWin: 0,
          totalScore: 0,
          lastPlayGood: false,
        ));
      }
    }
  }

  void _onGameHangmanPlayLetter(
      GameHangmanPlayLetter event, Emitter<GameHangmanState> emit) {
    if (state.status == GameHangmanStatus.over) {
      return;
    }

    List<String> lettersPlayed = List.from(state.lettersPlayed);
    var lives = state.lives;
    int found = state.needToWin;
    var lastPlayGood = state.lastPlayGood;
    int roundScore = state.currentScore;

    lettersPlayed.add(event.letterPlayed);

    if (!state.word.contains(event.letterPlayed[0])) {
      lives--;
      lastPlayGood = false;
      var totalScore = state.totalScore + roundScore;

      if (lives <= 0) {
        emit(state.copyWith(
          lettersPlayed: lettersPlayed,
          lives: lives,
          lastPlayGood: lastPlayGood,
          totalScore: totalScore,
        ));
      }
    } else {
      var countFound = event.letterPlayed.allMatches(state.word).length;
      found += countFound;
      lastPlayGood = true;
      roundScore += 10 * countFound;

      if (found >= state.word.length) {
        roundScore += 100;
        var totalScore = state.totalScore + roundScore;
        emit(state.copyWith(
            lettersPlayed: lettersPlayed,
            gameWon: true,
            needToWin: found,
            lastPlayGood: lastPlayGood,
            currentScore: roundScore,
            totalScore: totalScore));
      }
    }

    emit(state.copyWith(
        lettersPlayed: lettersPlayed,
        needToWin: found,
        lives: lives,
        lastPlayGood: lastPlayGood,
        currentScore: roundScore));
  }

  FutureOr<void> _onGameHangmanOver(
      GameHangmanGameOver event, Emitter<GameHangmanState> emit) {
    emit(state.copyWith(status: GameHangmanStatus.over));
  }
}
