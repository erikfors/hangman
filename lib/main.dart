import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Providers/simple_bloc_observer.dart';
import 'app.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}