import 'package:flutter/material.dart';
import 'package:simplescoring/utils/create_dialog.dart';
import 'package:simplescoring/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Items
  List todos = [
    ['Some Item', false],
    ['Some other item', true]
  ];

  void toggleState(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void createItem(String name) {
    setState(() {
      todos.add([name, false]);
    });
  }

  TextEditingController controller = TextEditingController();

  void addTodo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: CreateDialog(
            controller: controller,
            onSave: () {},
            // onSave: () {
            //   createItem(controller.text);
            //   Navigator.pop(context);
            // },
          ),
        );
      }
    );
    // setState(() {
    //   todos.add(['Wait a minute', false]);
    // });
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
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder:(context, index) {
            return TodoTile(
              taskName: todos[index][0], 
              taskCompleted: todos[index][1], 
              onChanged: (value) => toggleState(value, index)
            );
          },
        )
      )
    );
  }
}
