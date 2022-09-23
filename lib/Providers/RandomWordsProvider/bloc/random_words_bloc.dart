import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Logic/Requests/random_word_request.dart';

part 'random_words_event.dart';
part 'random_words_state.dart';

class RandomWordsBloc extends Bloc<RandomWordsEvent, RandomWordsState> {
  RandomWordsBloc() : super(const RandomWordsState()) {
    on<RandomWordFetched>(_onrandomWordFetched);
  }

  FutureOr<void> _onrandomWordFetched(
      RandomWordFetched event, Emitter<RandomWordsState> emit) async {
    try {
      final randomWord = await RandomWordRequest.getRandomWord();

      return emit(
          state.copyWith(status: RandomWordsStatus.success, word: randomWord));
    } catch (_) {
      emit(state.copyWith(status: RandomWordsStatus.failure));
    }
  }
}
