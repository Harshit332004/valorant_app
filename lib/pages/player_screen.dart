// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:valorant_app/viewmodel/valo_vm.dart';

// class PlayerScreen extends StatefulWidget {
//   const PlayerScreen({super.key});

//   @override
//   _PlayerScreenState createState() => _PlayerScreenState();
// }

// class _PlayerScreenState extends State<PlayerScreen> {
//   final TextEditingController _playerNameController = TextEditingController();
//   final TextEditingController _tagController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<PlayerViewModel>(context);

//     return Scaffold(
      
//       appBar: AppBar(title: const Text('Player Info')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _playerNameController,
//               decoration: const InputDecoration(labelText: 'Enter Player Name'),
//             ),
//             TextField(
//               controller: _tagController,
//               decoration: const InputDecoration(labelText: 'Enter Player Tag'),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String playerName = _playerNameController.text.trim();
//                 String tag = _tagController.text.trim();

//                 if (playerName.isNotEmpty && tag.isNotEmpty) {
//                   viewModel.fetchPlayer(playerName, tag);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please enter both player name and tag')),
//                   );
//                 }
//               },
//               child: const Text('Fetch Player Data'),
//             ),
//             const SizedBox(height: 16.0),
//             viewModel.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : viewModel.player != null
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Name: ${viewModel.player!.name}'),
//                           Text('Tag: ${viewModel.player!.tag}'),
//                           Text('PUUID: ${viewModel.player!.puuid}'),
//                           Text('Current Rank: ${viewModel.player!.currentData.currentTierPatched}'),
//                           Image.network(viewModel.player!.currentData.images.large),
//                           Text('Highest Rank: ${viewModel.player!.highestRank.patchedTier}'),
//                         ],
//                       )
//                     : const Center(child: Text('No player data')),
//           ],
//         ),
//       ),
//     );
//   }
// }