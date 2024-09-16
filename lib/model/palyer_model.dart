class Player {
  final String name;
  final String tag;
  final String currenttierPatched;

  Player({
    required this.name,
    required this.tag,
    required this.currenttierPatched,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      tag: json['tag'],
      currenttierPatched: json['currenttier_patched'],
    );
  }

  // Helper method to extract all players from the JSON response
  static List<Player> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Player.fromJson(json)).toList();
  }
}
