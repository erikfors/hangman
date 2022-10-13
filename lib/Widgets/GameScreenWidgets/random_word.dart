import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Providers/GameHangman/bloc/game_hangman_bloc.dart';

class RandomWord extends StatelessWidget {
  final String word;

  const RandomWord(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameHangmanBloc, GameHangmanState>(
      builder: (context, state) {
        switch (state.status) {
          case GameHangmanStatus.initial:
            return Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...word.characters
                    .map(
                      (character) => const SizedBox(
                          width: 35,
                          height: 35,
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                    )
                    .toList()
              ],
            );

          case GameHangmanStatus.playing:
            return Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...word.characters
                    .map((character) => SizedBox(
                          width: 35,
                          height: 35,
                          child: Row(
                            children: [
                              WordWidget(
                                character.toUpperCase(),
                                checkLetter(
                                  state.lettersPlayed,
                                  character.toUpperCase(),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList()
              ],
            );
          case GameHangmanStatus.over:
            return const Center(child: Text("Over"));
        }
      },
    );
  }
}

bool checkLetter(List<String> lettersplayed, String character) {
  return lettersplayed.contains(character);
}

class WordWidget extends StatelessWidget {
  final String letter;
  final bool show;
  const WordWidget(this.letter, this.show, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            show ? "$letter " : "",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
