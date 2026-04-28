import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplescoring/models/player.dart';
import 'package:simplescoring/providers/scores_cubit.dart';

class EditPlayerDialog extends StatefulWidget {
  final Player player;
  final BuildContext parentContext;

  const EditPlayerDialog({super.key, required this.player, required this.parentContext});

  @override
  State<EditPlayerDialog> createState() => _EditPlayerDialogState();
}

class _EditPlayerDialogState extends State<EditPlayerDialog> {
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.player.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    final ScoresCubit scoresCubit = BlocProvider.of<ScoresCubit>(widget.parentContext);

    return AlertDialog(
      title: Text('Edit Player'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              scoresCubit.editPlayerName(widget.player.name, value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Player Name',
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            scoresCubit.editPlayerName(widget.player.name, _controller.text);
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
