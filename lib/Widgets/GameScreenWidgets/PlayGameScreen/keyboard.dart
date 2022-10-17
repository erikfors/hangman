import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/Models/alphabet.dart';
import 'package:hangman/Providers/GameHangman/bloc/game_hangman_bloc.dart';

enum KeyState { neutral, wrong, right }

class GameKeyboard extends StatelessWidget {
  final Alphabet letters;
  final List<String> lettersplayed;
  final String word;
  const GameKeyboard(this.letters, this.lettersplayed, this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        ...letters.getAllLetters().entries.toList().map(
          (letter) {
            var letterString = Alphabet.getChar(letter.key);
            var state = KeyState.neutral;

            if (lettersplayed.contains(letterString)) {
              var found = false;
              for (var singleCharacter in word.characters) {
                if (singleCharacter == letterString) {
                  state = KeyState.right;
                  found = true;
                  break;
                }
              }

              if (!found) {
                state = KeyState.wrong;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: KeyboardKey(
                letter: letterString,
                state: state,
              ),
            );
          },
        ).toList()
      ],
    );
  }
}

class KeyboardKey extends StatelessWidget {
  final String letter;
  final KeyState state;
  const KeyboardKey({super.key, required this.letter, required this.state});

  @override
  Widget build(BuildContext context) {
    MaterialColor color;
    bool active;

    switch (state) {
      case KeyState.neutral:
        color = Colors.amber;
        active = true;
        break;
      case KeyState.wrong:
        color = Colors.red;
        active = false;
        break;
      case KeyState.right:
        color = Colors.green;
        active = false;
        break;
    }

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1.5, color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Material(
        color: color,
        child: BlocBuilder<GameHangmanBloc, GameHangmanState>(
          builder: (context, state) {
            return InkWell(
              splashColor: color,
              onTap: (active
                  ? () => {
                        context.read<GameHangmanBloc>().add(
                              GameHangmanPlayLetter(letterPlayed: letter),
                            ),
                      }
                  : null),
              child: Center(
                child: Text(
                  letter,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
