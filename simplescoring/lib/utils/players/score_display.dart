import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({
    super.key, 
    required this.score
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$score',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
