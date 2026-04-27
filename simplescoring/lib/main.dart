import 'package:flutter/material.dart';
import 'package:simplescoring/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.amber
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: colorScheme),
      home: HomePage()
    );
  }
}
