import 'package:flutter/material.dart';
import 'package:simplescoring/utils/players/player_score.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      children: [
        for (int i = 0; i < 20; i++)
        PlayerScore()
      ],
    );
  }
}
