import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hangman"),
      ),
      body: Center(child: ElevatedButton(
  onPressed: () {
      Beamer.of(context).beamToNamed("/game");
  },
  child: const Text("Start New Game"),
)),
    );
  }
}
