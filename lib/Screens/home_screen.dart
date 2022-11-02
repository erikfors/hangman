import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hangman/Widgets/General/MyButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "lib/Assets/hangman_background.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Hangman",
                style: TextStyle(fontFamily: 'PennyTheCherryBombChalk', color: Colors.white,fontSize: 65),
              ),
               const SizedBox(
                height:60,
              ),
              MyButton(
                onTap: () {
                  Beamer.of(context).beamToNamed("/game");
                },
                text: "Start New Game",
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  Beamer.of(context).beamToNamed("/game");
                },
                text: "View History",
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  Beamer.of(context).beamToNamed("/game");
                },
                text: "Settings",
              ),
            ],
          )),
        ),
      ),
    );
  }
}
