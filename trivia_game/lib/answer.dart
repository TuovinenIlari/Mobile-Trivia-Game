import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  final String answerKey;
  final String correctAnswer;

  const Answer(
      {super.key,
      required this.selectHandler,
      required this.answerText,
      required this.answerKey,
      required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                if (answerKey == correctAnswer) {
                  return Colors.green;
                } else {
                  return Colors.red;
                }
              }
            },
          ),
        ),
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            selectHandler();
// Here you can write your code
          });
        },
        child: Text(answerText),
      ),
    );
  }
}
