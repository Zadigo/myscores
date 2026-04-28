import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({
    super.key, 
    required this.score
  });

  @override
  Widget build(BuildContext context) {
    // Theme
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$score',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
