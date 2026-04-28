import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:simplescoring/models/player.dart';

class ScoresCubit extends Cubit<List<Player>> {
  ScoresCubit(): super([
    Player(name: "Player 1", score: 0),
    Player(name: "Player 2", score: 0),
    Player(name: "Player 3", score: 0),
  ]);

  @override
  void onChange(Change<List<Player>> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  // Method to get a player's score by name
  Player? getPlayerByName(String playerName) {
    return state.firstWhere((element) {
      return element.name == playerName;
    }, orElse: () => Player(name: playerName, score: -1));
  }

  Player? getPlayerByIndex(int index) {
    if (index >= 0 && index < state.length) {
      return state[index];
    }
    return null;
  }

  // Method to add a new player
  void addPlayer(String playerName) {
    state.add(Player(name: playerName, score: 0));
    emit(List.from(state));
  }

  // Method to remove a player
  void removePlayer(String playerName) {
    state.removeWhere((element) => element.name == playerName);
    emit(List.from(state));
  }

  // Reset only the score of a specific player to 0
  void resetPlayerScore(String playerName) {
    final player = getPlayerByName(playerName);
    if (player != null && player.score != -1) {
      player.score = 0;
      emit(List.from(state));
    }
  }

  // Reset all scores to 0
  void resetScores() {
    for (var player in state) {
      player.score = 0;
    }
    emit(List.from(state));
  }

  // Method to increment a player's score
  void increment(String playerName) {
    final player = getPlayerByName(playerName);


    if (player != null) {
      player.score++;
      emit(List.from(state));
      log('ScoresCubit increment: player = ${player.name}, score = ${player.score}');
    }
  }

  // Method to decrement a player's score
  void decrement(String playerName) {
    final player = getPlayerByName(playerName);

    if (player != null) {
      player.score--;
      emit(List.from(state));
      log('ScoresCubit decrement: player = ${player.name}, score = ${player.score}');
    }
  }
}
