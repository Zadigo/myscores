import 'package:flutter/material.dart';
import 'package:simplescoring/pages/home/index_page.dart';
import 'package:simplescoring/pages/home/edit_page.dart';
import 'package:simplescoring/pages/rankings.dart';
import 'package:simplescoring/pages/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Define the routes for the application
  Map<String, Widget Function(BuildContext)> get _routes => {
    '/home': (context) => const IndexPage(),
    '/home/edit': (context) => const EditPage(),
    '/rankings': (context) => const RankingsPage(),
    '/settings': (context) => const SettingsPage(),
  };

  // Define the global theme for the application
  // ThemeData get _theme => 

  @override
  Widget build(BuildContext context) {
    final String title = 'Simple Scoring';

    return MaterialApp(
      title: title,
      home: const IndexPage(),
      routes: _routes,
    );
  }
}
