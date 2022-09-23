import 'dart:math';

import 'package:dio/dio.dart';

class RandomWordRequest {
  static const String mainPath = "https://random-word-api.herokuapp.com";
  static const String allWordsPath = "/all";
  static const String randomWordsPath = "/word";
   static const String languages = "/languages";
  //all parameters are optional
  static const String numberParamether = "?number="; // pass a number
  static const String lengthParamether = "?length="; // pass a number
  static const String languageParamether =
      "?lang="; // pass a language zh,es,it,de, default english

  static Future<String> getRandomWord() async {
    var dio = Dio();
    var randomWord = "";
    try {
      final response = await dio.get(mainPath + randomWordsPath);

      randomWord = response.data[0];
    } catch (e) {
      print("getRandomWord Error: $e");
      rethrow;
    }

    return randomWord;
  }
}
