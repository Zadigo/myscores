import 'package:flutter/material.dart';
import 'package:simplescoring/utils/players/player_score.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (int i = 0; i < 5; i++)
          PlayerScore()
        ],
      )
    );
  }
}
