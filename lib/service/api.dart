import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:valorant_app/model/palyer_model.dart';


class ValorantApiService {
  final String baseUrl;
  final String apiKey;
  final String baseUrl2;

  ValorantApiService({
    required this.baseUrl,
    required this.apiKey,
    required this.baseUrl2,
  });

  Future<List<Player>> fetchPlayerMatchData(String playerName, String tag) async {
  final url = '$baseUrl2/ap/$playerName/$tag?size=10&api_key=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> playersJson = jsonResponse['data'][0]['players']['all_players'];
      return Player.fromJsonList(playersJson);
    } else {
      throw Exception('Failed to load player match data: ${response.body}');
    }
  } catch (error) {
    print('Error: $error');
    rethrow;
  }
}

}