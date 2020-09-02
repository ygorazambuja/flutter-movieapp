import 'package:json_annotation/json_annotation.dart';
import 'package:yshare/model/next_episode_to_air.dart';
import 'package:yshare/model/production_companies.dart';
import 'package:yshare/model/season.dart';

import 'created_by.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';

part 'tv_details.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class TvDetails {
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'created_by')
  final List<CreatedBy> createdBy;
  @JsonKey(name: 'episode_run_time')
  final List<int> episodeRunTime;
  @JsonKey(name: 'first_air_date')
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  @JsonKey(name: 'in_production')
  final bool inProduction;
  final List<String> languages;
  @JsonKey(name: 'last_air_date')
  final String lastAirDate;
  @JsonKey(name: 'last_episode_to_air')
  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  @JsonKey(name: 'next_episode_to_air')
  final NextEpisodeToAir nextEpisodeToAir;
  final List<Network> networks;
  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;
  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;
  @JsonKey(name: 'origin_country')
  final List<String> originCountry;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_name')
  final String originalName;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanies> productionCompanies;
  final List<Season> seasons;
  final String status;
  final String type;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  TvDetails({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.seasons,
    this.status,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  factory TvDetails.fromJson(Map<String, dynamic> json) =>
      _$TvDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TvDetailsToJson(this);
}
