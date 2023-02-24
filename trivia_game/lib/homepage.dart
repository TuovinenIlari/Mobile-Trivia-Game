import 'package:flutter/material.dart';
import 'package:trivia_game/quiz.dart';
import 'package:trivia_game/score.dart';

import 'copyright_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _questions = [
    {
      "question": "What is the largest planet in our solar system?",
      "answers": {"a": "Mars", "b": "Jupiter", "c": "Venus", "d": "Saturn"},
      "correct_answer": "b"
    },
    {
      "question":
          "What is the name of the first satellite launched into orbit?",
      "answers": {
        "a": "Sputnik 1",
        "b": "Explorer 1",
        "c": "Vanguard 1",
        "d": "Luna 1"
      },
      "correct_answer": "a"
    },
    {
      "question": "What is the name of the brightest star in the night sky?",
      "answers": {
        "a": "Vega",
        "b": "Polaris",
        "c": "Sirius",
        "d": "Betelgeuse"
      },
      "correct_answer": "c"
    },
    {
      "question": "What was the first animal to orbit the Earth?",
      "answers": {"a": "Dog", "b": "Monkey", "c": "Mouse", "d": "Rat"},
      "correct_answer": "a"
    },
    {
      "question": "What is the name of the first American woman in space?",
      "answers": {
        "a": "Sally Ride",
        "b": "Kathryn Sullivan",
        "c": "Judith Resnik",
        "d": "Mae Jemison"
      },
      "correct_answer": "a"
    },
    {
      "question": "What is the name of the first man to walk on the moon?",
      "answers": {
        "a": "Buzz Aldrin",
        "b": "Neil Armstrong",
        "c": "Michael Collins",
        "d": "Alan Shepard"
      },
      "correct_answer": "b"
    },
    {
      "question":
          "What is the name of the spacecraft that carried the first humans to land on the moon?",
      "answers": {
        "a": "Apollo 11",
        "b": "Mercury 7",
        "c": "Gemini 4",
        "d": "Vostok 1"
      },
      "correct_answer": "a"
    },
    {
      "question": "What is the name of the first space station?",
      "answers": {
        "a": "Skylab",
        "b": "Mir",
        "c": "Salyut 1",
        "d": "International Space Station"
      },
      "correct_answer": "c"
    },
    {
      "question":
          "What is the name of the first woman to complete a spacewalk?",
      "answers": {
        "a": "Svetlana Savitskaya",
        "b": "Kathryn Sullivan",
        "c": "Judith Resnik",
        "d": "Mae Jemison"
      },
      "correct_answer": "a"
    },
    {
      "question": "What is the name of the largest moon of Saturn?",
      "answers": {"a": "Mimas", "b": "Titan", "c": "Enceladus", "d": "Iapetus"},
      "correct_answer": "b"
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var _highScore = 0;
  var quizSelected = false;

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
      setState(() {
        quizSelected = true;
      });
    }
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
            const DrawerHeader(
              child: Text('Trivia Game'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
                      Quiz(
                        questions: _questions,
                        questionIndex: _questionIndex,
                        answerQuestion: answerQuestion,
                      ),
                      Score(
                        totalScore: _totalScore,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
