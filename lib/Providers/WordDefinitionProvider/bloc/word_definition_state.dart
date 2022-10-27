part of 'word_definition_bloc.dart';

enum WordDefinitionStatus { initial, success, failure }

class WordDefinitionState extends Equatable {
  final WordDefinitionStatus status;
  final List<String> definitions;

  const WordDefinitionState({
    this.status = WordDefinitionStatus.initial,
    this.definitions = const <String>[],
  });

  WordDefinitionState copyWith(
      {WordDefinitionStatus? status, List<String>? definitions}) {
    return WordDefinitionState(
        definitions: definitions ?? this.definitions,
        status: status ?? this.status);
  }

  @override
  String toString() {
    return '''WordDefinition { status: $status, definition: $definitions }''';
  }

  @override
  List<Object> get props => [status, definitions];
}
