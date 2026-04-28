import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplescoring/pages/home/index_page.dart';
import 'package:simplescoring/pages/rankings.dart';
import 'package:simplescoring/pages/settings.dart';
import 'package:simplescoring/providers/scores_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ScoresCubit _scoresCubit = ScoresCubit();

  // Define the routes
  // Map<String, Widget Function(BuildContext)> get _routes => {
  //   '/home': (context) => const IndexPage(),
  //   '/home/edit': (context) => const EditPage(),
  //   '/rankings': (context) => const RankingsPage(),
  //   '/settings': (context) => const SettingsPage(),
  // };

  final List<Widget> _routes = [
    const IndexPage(),
    const RankingsPage(),
    const SettingsPage(),
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
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

    return MaterialApp(
      title: title,
      home: BlocProvider<ScoresCubit>(
        create: (context) => _scoresCubit,
        child: Scaffold(
          body: _routes[_currentIndex],
          appBar: AppBar(
            leading: Icon(Icons.sort),
            backgroundColor: colorScheme.primary.withAlpha(10),
            actions: [
              IconButton(
                onPressed: () => _scoresCubit.addPlayer(), 
                icon: Icon(Icons.add)
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
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
            currentIndex: _currentIndex,
          ),
        ),
      ),
      // routes: _routes,
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
}
