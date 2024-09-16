import 'package:flutter/material.dart';

import 'package:valorant_app/model/palyer_model.dart';
import 'package:valorant_app/repo/repo.dart';

class PlayerMatchHistoryViewModel with ChangeNotifier {
  final ValorantRepository repository;
  List<Player>? matchHistory;
  bool isLoading = false;

  PlayerMatchHistoryViewModel({required this.repository});

  Future<void> fetchMatchHistory(String playerName, String tag) async {
    if (matchHistory != null) return; // Avoid unnecessary future fetching and notify
    isLoading = true;
    notifyListeners();

    try {
      matchHistory = await repository.getPlayerMatchHistory(playerName, tag);
    } catch (error) {
      print('Error fetching match history: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
