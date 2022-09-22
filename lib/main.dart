import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Logic/Requests/random_word_request.dart';

import 'Providers/simple_bloc_observer.dart';
import 'app.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
    var word = await RandomWordRequest.getRandomWord();
    print(word);
  runApp(App());
}