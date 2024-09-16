
import 'package:valorant_app/service/api.dart';
import 'package:valorant_app/model/palyer_model.dart';

class ValorantRepository {
  final ValorantApiService apiService;

  ValorantRepository({required this.apiService});

  // Future<AllPlayer> getPlayerData(String playerName, String tag) async {
  //   try {
  //     return await apiService.fetchPlayerData(playerName, tag);
  //   } catch (e) {
  //     throw Exception('Error fetching player data: $e');
  //   }
  // }

   Future<List<Player>> getPlayerMatchHistory(String playerName, String tag) async {
    try {
      return await apiService.fetchPlayerMatchData(playerName, tag); // This returns List<Player>
    } catch (e) {
      throw Exception('Error fetching player match history: $e');
    }
  }
}