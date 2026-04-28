import 'package:flutter/material.dart';
import 'package:simplescoring/providers/scores_cubit.dart';
import 'package:simplescoring/utils/players/score_card.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scores = ScoresCubit();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      itemCount: scores.state.length,
      itemBuilder: (context, index) {
        return ScoreCard(player: scores.state[index],);
      },
    );
  }
}
