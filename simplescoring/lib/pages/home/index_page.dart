import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplescoring/providers/scores_notifier.dart';
import 'package:simplescoring/utils/players/player_score.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List items = Provider.of<ScoresNotifier>(context).allScores;

    print(items);

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PlayerScore();
      },
    );
  }
}
