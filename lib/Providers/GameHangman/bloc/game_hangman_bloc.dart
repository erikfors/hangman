import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_hangman_event.dart';
part 'game_hangman_state.dart';

class GameHangmanBloc extends Bloc<GameHangmanEvent, GameHangmanState> {
  GameHangmanBloc() : super(GameHangmanInitial()) {
    on<GameHangmanGameStarted>(_onGameHangmanGameStarted);
    on<GameHangmanPlayLetter>(_onGameHangmanPlayLetter);
  }

  void _onGameHangmanGameStarted(
      GameHangmanGameStarted event, Emitter<GameHangmanState> emit) {
    if (state.status == GameHangmanStatus.initial) {
      return emit(state.copyWith(
          status: GameHangmanStatus.playing, word: event.choosenWord.toUpperCase()));
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

    lettersPlayed.add(event.letterPlayed);

    if (!state.word.contains(event.letterPlayed[0])) {
      lives--;
      lastPlayGood = false;

      if (lives <= 0) {
        emit(state.copyWith(
            status: GameHangmanStatus.over,
            lettersPlayed: lettersPlayed,
            lives: lives,
            lastPlayGood: lastPlayGood));
      }
    } else {
      found += event.letterPlayed.allMatches(state.word).length;
      lastPlayGood = true;

      if (found >= state.word.length) {
        emit(state.copyWith(
            status: GameHangmanStatus.over,
            lettersPlayed: lettersPlayed,
            gameWon: true,
            needToWin: found,
            lastPlayGood: lastPlayGood));
      }
    }

    emit(state.copyWith(
        lettersPlayed: lettersPlayed, needToWin: found, lives: lives, lastPlayGood: lastPlayGood));
  }
}
