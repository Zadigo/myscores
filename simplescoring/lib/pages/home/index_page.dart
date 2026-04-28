import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplescoring/models/player.dart';
import 'package:simplescoring/providers/scores_cubit.dart';
import 'package:simplescoring/utils/players/score_card.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoresCubit, List<Player>>(
      builder: (context, players) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          itemCount: players.length,
          itemBuilder: (context, index) {
            return ScoreCard(player: players[index]);
          },
        );
      },
    );
  }
}
