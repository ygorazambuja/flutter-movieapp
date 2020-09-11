import 'package:json_annotation/json_annotation.dart';

import 'package:yshare/domain/entities/episode.dart';

part 'season_details.g.dart';

@JsonSerializable(createFactory: true, createToJson: true, explicitToJson: true)
class SeasonDetails {
  final int id;
  @JsonKey(name: 'air_date')
  final String airDate;
  final List<Episode> episodes;
  final String name;
  final String overview;
  @JsonKey(name: 'show_id')
  final int showId;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'season_number')
  final int seasonNumber;

  SeasonDetails({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.showId,
    this.posterPath,
    this.seasonNumber,
  });

  factory SeasonDetails.fromJson(Map<String, dynamic> json) =>
      _$SeasonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonDetailsToJson(this);

  @override
  String toString() {
    return 'SeasonDetails(id: $id, airDate: $airDate, episodes: $episodes, name: $name, overview: $overview, showId: $showId, posterPath: $posterPath, seasonNumber: $seasonNumber)';
  }
}
