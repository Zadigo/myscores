import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  final bool isChecked = false;

  void selectCheckBox(bool? value) {
    
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked, 
              onChanged: selectCheckBox
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: const Text(
                "Todo Item", 
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
