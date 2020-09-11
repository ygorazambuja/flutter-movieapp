import 'package:json_annotation/json_annotation.dart';

import 'package:yshare/domain/entities/crew.dart';
import 'package:yshare/domain/entities/guest_star.dart';

part 'episode.g.dart';

@JsonSerializable(createFactory: true, createToJson: true, explicitToJson: true)
class Episode {
  @JsonKey(name: 'air_date')
  final String airDate;

  @JsonKey(name: 'episode_number')
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  @JsonKey(name: 'production_code')
  final String productionCode;
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @JsonKey(name: 'show_id')
  final int showId;
  @JsonKey(name: 'still_path')
  final String stillPath;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final List<Crew> crew;
  @JsonKey(name: 'guest_stars')
  final List<GuestStar> guestStars;

  Episode({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });
  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  String toString() {
    return 'Episode(airDate: $airDate, episodeNumber: $episodeNumber, id: $id, name: $name, overview: $overview, productionCode: $productionCode, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount, crew: $crew, guestStars: $guestStars)';
  }
}
