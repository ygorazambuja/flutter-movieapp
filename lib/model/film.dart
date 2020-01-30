import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  int id;
  bool video;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String title;
  @JsonKey(name: 'release_data')
  String releaseDate;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genres')
  List<Genres> genreIds;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  bool adult;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  String tagline;
  int revenue;
  int runtime;

  double popularity;
  @JsonKey(name: 'media_type')
  String mediaType;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountries> productionCountries;
  Film(
      {this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.mediaType,
      this.tagline,
      this.revenue,
      this.runtime});

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
  Map<String, dynamic> toJson() => _$FilmToJson(this);
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
