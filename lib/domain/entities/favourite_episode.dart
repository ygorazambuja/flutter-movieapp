import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourite_episode.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class FavouriteEpisode {
  final int episodeId;
  final int episodeNumber;
  final int seasonId;
  final int showId;
  final String showName;

  FavouriteEpisode({
    @required this.showName,
    @required this.episodeId,
    @required this.episodeNumber,
    @required this.seasonId,
    @required this.showId,
  });

  factory FavouriteEpisode.fromJson(Map<String, dynamic> json) =>
      _$FavouriteEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteEpisodeToJson(this);

  @override
  String toString() {
    return 'FavouriteEpisode(episodeId: $episodeId, episodeNumber: $episodeNumber, seasonId: $seasonId, showId: $showId)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FavouriteEpisode &&
        o.episodeId == episodeId &&
        o.episodeNumber == episodeNumber &&
        o.seasonId == seasonId &&
        o.showId == showId &&
        o.showName == showName;
  }

  @override
  int get hashCode {
    return episodeId.hashCode ^
        episodeNumber.hashCode ^
        seasonId.hashCode ^
        showId.hashCode ^
        showName.hashCode;
  }
}
