import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  
  @override
  Widget build(BuildContext context) {
    // Theme
    final ThemeData theme = Theme.of(context);

    // State
    final ScoresCubit scoresCubit = BlocProvider.of<ScoresCubit>(context);

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
                    onPressed: () => scoresCubit.decrement(player.name),
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
                    onPressed: () => scoresCubit.increment(player.name),
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
