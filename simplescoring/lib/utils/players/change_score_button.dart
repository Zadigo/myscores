import 'package:flutter/material.dart';

class ChangeScoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const ChangeScoreButton({
    super.key, 
    required this.onPressed, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Icon(icon, color: theme.primaryColorLight),
    );
  }
}
