import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int totalScore;

  const Score({super.key, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Your score is $totalScore",
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
