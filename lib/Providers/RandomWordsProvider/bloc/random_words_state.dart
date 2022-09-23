part of 'random_words_bloc.dart';

enum RandomWordsStatus { initial, success, failure }

class RandomWordsState extends Equatable {
  final RandomWordsStatus status;
  final String word;

  const RandomWordsState(
      {this.status = RandomWordsStatus.initial, this.word = ""});

  RandomWordsState copyWith({RandomWordsStatus? status, String? word}) {
    return RandomWordsState(
      status: status ?? this.status,
      word: word ?? this.word,
    );
  }

  @override
  String toString() {
    return '''RandomWordsState { status: $status, word: $word }''';
  }

  @override
  List<Object> get props => [status, word];
}
