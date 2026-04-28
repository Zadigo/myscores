import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DialogButton({
    super.key, 
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title)
    );
  }
}
