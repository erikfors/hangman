import 'package:dio/dio.dart';
import 'package:hangman/Assets/secrets.dart';

class WordDefinitionRequest {
  static const String mainPath =
      "https://www.dictionaryapi.com/api/v3/references/collegiate/json/";
  //need word to look for
  static const String keyHeader = "?key=";
  static const String key = merriamWebsterKey;

  static Future<List<String>> getWordDefinitions(String word) async {
    var dio = Dio();
    List<dynamic> definitions = [];
    try {
      final response = await dio.get(mainPath + word + keyHeader + key);

      definitions = response.data[0]["shortdef"];

    } catch (e) {
      print("getWordDefinition Error: $e");
      rethrow;
    }

    return definitions.cast<String>();
  }
}
