// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode(
    airDate: json['air_date'] as String,
    episodeNumber: json['episode_number'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    overview: json['overview'] as String,
    productionCode: json['production_code'] as String,
    seasonNumber: json['season_number'] as int,
    showId: json['show_id'] as int,
    stillPath: json['still_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    crew: (json['crew'] as List)
        ?.map(
            (e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    guestStars: (json['guest_stars'] as List)
        ?.map((e) =>
            e == null ? null : GuestStar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'crew': instance.crew?.map((e) => e?.toJson())?.toList(),
      'guest_stars': instance.guestStars?.map((e) => e?.toJson())?.toList(),
    };
