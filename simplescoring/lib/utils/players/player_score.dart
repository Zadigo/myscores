import 'package:flutter/material.dart';
import 'package:simplescoring/utils/players/change_score_button.dart';
import 'package:simplescoring/utils/players/score_display.dart';

class PlayerScore extends StatelessWidget {
  const PlayerScore({super.key});

  void _proxyIncrement(BuildContext context) {
    
  }

  void _proxyDecrement(BuildContext context) {
    
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
                Flexible(
                  flex: 1,
                  child: ChangeScoreButton(
                    onPressed: () => _proxyDecrement(context),
                    icon: Icons.remove,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ScoreDisplay(score: 20),
                ),
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
