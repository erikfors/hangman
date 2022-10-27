part of 'word_definition_bloc.dart';

abstract class WordDefinitionEvent extends Equatable {
  const WordDefinitionEvent();

  @override
  List<Object> get props => [];
}

class WordDefinitionFetched extends WordDefinitionEvent{}
