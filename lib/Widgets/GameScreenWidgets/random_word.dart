import 'package:flutter/material.dart';

class RandomWord extends StatelessWidget {
  final String word;

  const RandomWord(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: word.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            WordWidget(word[index], false),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}

class WordWidget extends StatelessWidget {
  final String letter;
  final bool show;
  const WordWidget(this.letter, this.show, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
