import 'package:flutter/material.dart';
import 'package:simplescoring/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void addTodo() {

  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return MaterialApp(
      theme: ThemeData(colorScheme: colorScheme),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
          backgroundColor: colorScheme.surfaceDim,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addTodo,
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            TodoTile()
          ],
        )
      ),
    );
  }
}
