class ValorantPlayer {
  final String name;
  final String tag;
  final String puuid;
  final CurrentData currentData;
  final HighestRank highestRank;

  ValorantPlayer({
    required this.name,
    required this.tag,
    required this.puuid,
    required this.currentData,
    required this.highestRank,
  });

  factory ValorantPlayer.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ValorantPlayer(
      name: data['name'],
      tag: data['tag'],
      puuid: data['puuid'],
      currentData: CurrentData.fromJson(data['current_data']),
      highestRank: HighestRank.fromJson(data['highest_rank']),
    );
  }
}

class CurrentData {
  final int currentTier;
  final String currentTierPatched;
  final Images images;
  final int rankingInTier;
  final int mmrChangeToLastGame;
  final int elo;
  final int gamesNeededForRating;
  final bool old;

  CurrentData({
    required this.currentTier,
    required this.currentTierPatched,
    required this.images,
    required this.rankingInTier,
    required this.mmrChangeToLastGame,
    required this.elo,
    required this.gamesNeededForRating,
    required this.old,
  });

  factory CurrentData.fromJson(Map<String, dynamic> json) {
    return CurrentData(
      currentTier: json['currenttier'],
      currentTierPatched: json['currenttierpatched'],
      images: Images.fromJson(json['images']),
      rankingInTier: json['ranking_in_tier'],
      mmrChangeToLastGame: json['mmr_change_to_last_game'],
      elo: json['elo'],
      gamesNeededForRating: json['games_needed_for_rating'],
      old: json['old'],
    );
  }
}

class Images {
  final String small;
  final String large;
  final String triangleDown;
  final String triangleUp;

  Images({
    required this.small,
    required this.large,
    required this.triangleDown,
    required this.triangleUp,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      small: json['small'],
      large: json['large'],
      triangleDown: json['triangle_down'],
      triangleUp: json['triangle_up'],
    );
  }
}

class HighestRank {
  final bool old;
  final int tier;
  final String patchedTier;
  final String season;

  HighestRank({
    required this.old,
    required this.tier,
    required this.patchedTier,
    required this.season,
  });

  factory HighestRank.fromJson(Map<String, dynamic> json) {
    return HighestRank(
      old: json['old'],
      tier: json['tier'],
      patchedTier: json['patched_tier'],
      season: json['season'],
    );
  }
}