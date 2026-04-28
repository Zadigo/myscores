import 'package:flutter/material.dart';

class PlayerScore extends StatelessWidget {
  const PlayerScore({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: theme.primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text('Header')),
      ),
    );
  }
}
