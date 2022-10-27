import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hangman/Logic/Requests/word_definition_request.dart';

part 'word_definition_event.dart';
part 'word_definition_state.dart';

class WordDefinitionBloc
    extends Bloc<WordDefinitionEvent, WordDefinitionState> {
  final String word;
  WordDefinitionBloc(this.word) : super(const WordDefinitionState()) {
    on<WordDefinitionFetched>(_onDefinitionWordFetched);
  }

  Future<void> _onDefinitionWordFetched(
      WordDefinitionFetched event, Emitter<WordDefinitionState> emit) async {
    try {
      final definitions = await WordDefinitionRequest.getWordDefinitions(word);

      return emit(state.copyWith(
          status: WordDefinitionStatus.success, definitions: definitions));
    } catch (_) {
      emit(state.copyWith(status: WordDefinitionStatus.failure));
    }
  }
}
