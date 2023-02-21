import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List questions;
  final int questionIndex;

  const Quiz({
    super.key,
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answers'] as Map<String, String>)
            .entries
            .map(
              (entry) => TextButton(
                onPressed: () {
                  print(entry.key);
                  if (entry.key == questions[questionIndex]['correct_answer']) {
                    print('Correct!');
                  } else {
                    print('Incorrect!');
                  }
                },
                child: Text(entry.value),
              ),
            ),
      ],
    );
  }
}
