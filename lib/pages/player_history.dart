import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_app/viewmodel/match_vm.dart'; 
// Assuming you have this model
class PlayerMatchHistoryScreen extends StatefulWidget {
  final String playerName;
  final String tag;

  const PlayerMatchHistoryScreen({
    Key? key,
    required this.playerName,
    required this.tag,
  }) : super(key: key);

  @override
  _PlayerMatchHistoryScreenState createState() => _PlayerMatchHistoryScreenState();
}

class _PlayerMatchHistoryScreenState extends State<PlayerMatchHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<PlayerMatchHistoryViewModel>(context, listen: false);
      viewModel.fetchMatchHistory(widget.playerName, widget.tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlayerMatchHistoryViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Match History'),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.matchHistory == null || viewModel.matchHistory!.isEmpty
              ? const Center(child: Text('No match history available.'))
              : ListView.builder(
                  itemCount: viewModel.matchHistory!.length,
                  itemBuilder: (context, index) {
                    final player = viewModel.matchHistory![index];
                    return ListTile(
                      title: Text('${player.name}#${player.tag}'),
                      subtitle: Text('Current Rank: ${player.currenttierPatched}'),
                    );
                  },
                ),
    );
  }
}
