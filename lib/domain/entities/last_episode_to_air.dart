import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class LastEpisodeToAir {
  @JsonKey(name: 'air_date')
  final String airDate;
  @JsonKey(name: 'episode_number')
  final int episode_number;
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

  LastEpisodeToAir({
    this.airDate,
    this.episode_number,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);
  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}
