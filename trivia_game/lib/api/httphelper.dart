import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPHelper {
  //-- Fetch space questions
  Future<List> fetchSpaceQuestions() async {
    List questions = [];

    print("Fetching questions...");

    http.Response response = await http.get(
        Uri.parse('https://www.ilarituovinen.fi/trivia/space_questions.json'));
    //print(response.body);

    questions = jsonDecode(response.body);

    print("Questions fetched");

    return questions;
  }
}
