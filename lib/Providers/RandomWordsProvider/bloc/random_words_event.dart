part of 'random_words_bloc.dart';

abstract class RandomWordsEvent extends Equatable {
  const RandomWordsEvent();

  @override
  List<Object> get props => [];
}

class RandomWordFetched extends RandomWordsEvent{}
