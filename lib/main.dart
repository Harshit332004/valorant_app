import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_app/service/api.dart';
import 'package:valorant_app/repo/repo.dart';
import 'package:valorant_app/viewmodel/match_vm.dart';
import 'package:valorant_app/pages/player_history.dart'; // Import the new screen

void main() {
  // Define base URLs and API key
  const baseUrl = 'https://api.henrikdev.xyz/valorant/v2/mmr';
  const baseUrl2 = 'https://api.henrikdev.xyz/valorant/v3/matches'; // Correct Base URL
  const apiKey = 'HDEV-990890cf-68cf-4263-afce-446dadda0b13'; // Replace with your actual API Key

  // Initialize the API service and repository
  final apiService = ValorantApiService(baseUrl: baseUrl, baseUrl2: baseUrl2, apiKey: apiKey);
  final repository = ValorantRepository(apiService: apiService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlayerMatchHistoryViewModel(repository: repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Player Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerMatchHistoryScreen(playerName: 'Gunner', tag: 'GG69'),
    );
  }
}
