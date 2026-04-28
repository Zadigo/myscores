import 'dart:developer';

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

    log('ScoreDisplay build: score = $score');

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: theme.primaryColor.withAlpha(700),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$score',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: theme.primaryColorLight),
        ),
      ),
    );
  }
}
