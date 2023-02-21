import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          questionText,
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
