
// import 'package:valorant_app/model/palyer_model.dart';
// import 'package:valorant_app/model/playerdet.dart';
// import 'package:valorant_app/repo/repo.dart';
// import 'package:flutter/material.dart';

// class PlayerViewModel with ChangeNotifier {
//   final ValorantRepository repository;
//   ValorantPlayer? player;
//   bool isLoading = false;

//   PlayerViewModel({required this.repository});

//   Future<void> fetchPlayer(String playerName, String hash) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       player = await repository.getPlayerData(playerName, hash);
//     } catch (error) {
//       // Handle error
//       print('Error fetching player data: $error');
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }




  
// }