import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Tv {
  @JsonKey(name: 'original_name')
  final String originalName;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'media_type')
  final String mediaType;
  final String name;
  final double popularity;
  @JsonKey(name: 'origin_country')
  final List<String> originCountry;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'first_air_date')
  final String firstAirDate;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  final int id;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;

  Tv({
    this.originalName,
    this.genreIds,
    this.mediaType,
    this.name,
    this.popularity,
    this.originCountry,
    this.voteCount,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.id,
    this.voteAverage,
    this.overview,
    this.posterPath,
  });

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);
  Map<String, dynamic> toJson() => _$TvToJson(this);
}
