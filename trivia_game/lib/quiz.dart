import 'package:flutter/material.dart';
import 'package:trivia_game/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  void answerHander(entry) {
    //TODO: Make button colour stay green or red for 500ms
    Future.delayed(const Duration(milliseconds: 500), () {
      if (entry.key == questions[questionIndex]['correct_answer']) {
        print('Correct!');
        answerQuestion(1);
      } else {
        print('Incorrect!');
        answerQuestion(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText: questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answers'] as Map<String, String>)
            .entries
            .map(
              (entry) => Answer(
                selectHandler: () => answerHander(entry),
                answerText: entry.value,
                answerKey: entry.key,
                correctAnswer:
                    questions[questionIndex]['correct_answer'] as String,
              ),
            ),
      ],
    );
  }
}
