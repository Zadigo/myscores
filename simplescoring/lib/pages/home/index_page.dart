import 'package:flutter/material.dart';
import 'package:simplescoring/utils/players/player_score.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PlayerScore();
      },
    );
  }
}
