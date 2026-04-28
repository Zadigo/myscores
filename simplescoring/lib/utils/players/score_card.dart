import 'package:flutter/material.dart';
import 'package:simplescoring/models/player.dart';
import 'package:simplescoring/providers/scores_cubit.dart';
import 'package:simplescoring/utils/players/change_score_button.dart';
import 'package:simplescoring/utils/players/score_display.dart';

class ScoreCard extends StatelessWidget {
  final Player player;

  const ScoreCard({
    super.key, 
    required this.player
  });

  void _proxyIncrement(BuildContext context) {
    ScoresCubit().increment(player.name);
  }

  void _proxyDecrement(BuildContext context) {
    ScoresCubit().decrement(player.name);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          color: theme.primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Decrement button
                Flexible(
                  flex: 1,
                  child: ChangeScoreButton(
                    onPressed: () => _proxyDecrement(context),
                    icon: Icons.remove,
                  ),
                ),
                
                // Score display
                Flexible(
                  flex: 2,
                  child: ScoreDisplay(score: player.score),
                ),

                // Increment button
                Flexible(
                  flex: 1,
                  child: ChangeScoreButton(
                    onPressed: () => _proxyIncrement(context),
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
