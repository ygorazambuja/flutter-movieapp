import 'package:json_annotation/json_annotation.dart';

part 'next_episode_to_air.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class NextEpisodeToAir {
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

  NextEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount});

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$NextEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$NextEpisodeToAirToJson(this);

  @override
  String toString() {
    return 'NextEpisodeToAir(airDate: $airDate, episodeNumber: $episodeNumber, id: $id, name: $name, overview: $overview, productionCode: $productionCode, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
