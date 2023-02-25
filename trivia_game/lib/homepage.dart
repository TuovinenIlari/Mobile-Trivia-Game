import 'package:flutter/material.dart';
import 'package:trivia_game/quiz.dart';
import 'package:trivia_game/score.dart';
import 'package:trivia_game/api/httphelper.dart';
import 'copyright_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userName});
  final String userName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _questions = [];
  var _questionIndex = 0;
  var _totalScore = 0;
  var _highScore = 0;
  var quizSelected = false;
  Future<List>? _spacequestions;

  void answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      if (_questionIndex >= _questions.length) {
        _highScore = _totalScore;
        _questionIndex = 0;
        _totalScore = 0;
        quizSelected = false;
      }
    });
    _totalScore += score;
  }

  void selectQuizGategory(String category) {
    var quizCategory = category;

    if (quizCategory == 'space') {
      getQuestions(quizCategory);

      setState(() {
        quizSelected = true;
      });
    } else if (quizCategory == 'history') {
      getQuestions(quizCategory);

      setState(() {
        quizSelected = true;
      });
    } else if (quizCategory == "film") {
      getQuestions(quizCategory);

      setState(() {
        quizSelected = true;
      });
    } else {
      print("Error: No category selected");
    }
  }

  void getQuestions(String category) async {
    _spacequestions = HTTPHelper().fetchSpaceQuestions(category);
    _questions = await _spacequestions!;
    print("valmis");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia Game'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Username: ${widget.userName}"),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              userName: widget.userName,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.score),
              title: const Text('Leaderboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            const AboutListTile(
              icon: Icon(Icons.info),
              applicationName: 'Trivia Game',
              applicationVersion: '1.0.0',
              applicationIcon: Icon(Icons.info),
              aboutBoxChildren: [
                Text(
                  "MIT LICENSE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CopyrightPage(),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
            child: quizSelected == false
                ? Column(
                    children: [
                      const Text(
                        "Select a quiz category",
                        style: TextStyle(fontSize: 36),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            selectQuizGategory("space");
                          },
                          child: const Text('Space')),
                      ElevatedButton(
                          onPressed: () {
                            selectQuizGategory("history");
                          },
                          child: const Text('History')),
                      ElevatedButton(
                          onPressed: () {
                            selectQuizGategory("film");
                          },
                          child: const Text('Film')),
                      Text("High Score: $_highScore",
                          style: const TextStyle(fontSize: 36))
                    ],
                  )
                : Column(
                    children: [
                      FutureBuilder(
                          future: _spacequestions,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Error"),
                              );
                            }
                            if (snapshot.hasData) {
                              return (Column(
                                children: [
                                  Quiz(
                                    questions: _questions,
                                    questionIndex: _questionIndex,
                                    answerQuestion: answerQuestion,
                                  ),
                                  Score(
                                    totalScore: _totalScore,
                                  ),
                                ],
                              ));
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
