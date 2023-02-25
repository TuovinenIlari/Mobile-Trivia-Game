import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPHelper {
  //-- Fetch space questions
  Future<List> fetchSpaceQuestions(String quizCategory) async {
    List questions = [];
    quizCategory += '_questions.json';

    print("Fetching questions...");

    http.Response response = await http
        .get(Uri.parse('https://www.ilarituovinen.fi/trivia/$quizCategory'));
    //print(response.body);

    questions = jsonDecode(response.body);

    print("Questions fetched");

    return questions;
  }
}
