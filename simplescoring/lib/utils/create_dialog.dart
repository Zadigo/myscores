import 'package:flutter/material.dart';
import 'package:simplescoring/utils/dialog_button.dart';

class CreateDialog extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSave;

  const CreateDialog({
    super.key,
    required this.controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Row(children: [
            DialogButton(title: "Cancel", onPressed: () => Navigator.pop(context),),
            DialogButton(title: "Save", onPressed: onSave,)
          ],
        ),
        ],
      ),
    );
  }
}
