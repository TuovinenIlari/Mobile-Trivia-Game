import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answers'] as Map<String, String>)
            .entries
            .map(
              (entry) => ElevatedButton(
                onPressed: () {
                  print(entry.key);
                  if (entry.key == questions[questionIndex]['correct_answer']) {
                    print('Correct!');
                    answerQuestion(1);
                  } else {
                    print('Incorrect!');
                    answerQuestion(0);
                  }
                },
                child: Text(entry.value),
              ),
            ),
      ],
    );
  }
}
