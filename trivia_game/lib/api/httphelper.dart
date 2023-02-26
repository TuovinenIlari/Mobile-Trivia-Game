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

  Future<List> fetchLeaderBoard() async {
    List leaderBoard = [];

    print("Fetching leader board...");

    http.Response response = await http
        .get(Uri.parse('http://64.227.75.70/node/trivia/leaderboard'));

    if (response.statusCode == 200) {
      leaderBoard = jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return leaderBoard;
  }
}
