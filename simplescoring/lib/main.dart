import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplescoring/pages/home/index_page.dart';
import 'package:simplescoring/pages/home/edit_page.dart';
import 'package:simplescoring/pages/rankings.dart';
import 'package:simplescoring/pages/settings.dart';
import 'package:simplescoring/providers/scores_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScoresNotifier(),
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Define the routes
  Map<String, Widget Function(BuildContext)> get _routes => {
    '/home': (context) => const IndexPage(),
    '/home/edit': (context) => const EditPage(),
    '/rankings': (context) => const RankingsPage(),
    '/settings': (context) => const SettingsPage(),
  };

  void _onTap(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    final String title = 'Simple Scoring';

    // Color scheme
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      secondary: Colors.orange,
      tertiary: Colors.green,
      error: Colors.red,
      brightness: Brightness.light,
    );

    // Text theme
    final TextTheme textTheme = GoogleFonts.manropeTextTheme();
    // ThemeData.light().textTheme.apply(
    //   fontFamily: GoogleFonts.manrope().fontFamily,
    // );

    final List items = Provider.of<ScoresNotifier>(context).allScores;

    print(items);

    return MaterialApp(
      title: title,
      home: Scaffold(
        body: _routes['/home']!(context),
        appBar: AppBar(
          leading: Icon(Icons.sports_score),
          backgroundColor: colorScheme.primary.withAlpha(10),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Rankings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: _onTap,
        ),
      ),
      routes: _routes,
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
}
