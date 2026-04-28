import 'package:flutter/material.dart';

class ScoresNotifier extends ChangeNotifier {
  // List of scores
  List<Map<String, dynamic>> scores = [
    {"name": "Player 1", "score": 0},
    {"name": "Player 2", "score": 0},
    {"name": "Player 3", "score": 0},
  ];

  // Getter for scores
  List<Map<String, dynamic>> get allScores => scores;

  // Method to get a player's score by name
  Map<String, dynamic> getPlayer(String playerName) {
    return scores.firstWhere((element) {
      return element['name'] == playerName;
    }, orElse: () => {'name': playerName, 'score': -1});
  }

  // Method to add a new player
  void addPlayer(String playerName) {
    scores.add({"name": playerName, "score": 0});
    notifyListeners();
  }
  
  // Method to remove a player
  void removePlayer(String playerName) {
    scores.removeWhere((element) => element['name'] == playerName);
    notifyListeners();
  }

  // Reset only the score of a specific player to 0
  void resetPlayerScore(String playerName) {
    final player = getPlayer(playerName);
    if (player['score'] != -1) {
      player['score'] = 0;
      notifyListeners();
    }
  }

  // Reset all scores to 0
  void resetScores() {
    for (var player in scores) {
      player['score'] = 0;
    }
    notifyListeners();
  }

  // Method to increment a player's score
  void increment(String playerName) {
    final player = getPlayer(playerName);
    if (player['score'] != -1) {
      player['score']++;
      notifyListeners();
    }
  }

  // Method to decrement a player's score
  void decrement(String playerName) {
    final player = getPlayer(playerName);
    if (player['score'] != -1) {
      player['score']--;
      notifyListeners();
    }
  }
}
