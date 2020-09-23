// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteEpisode _$FavouriteEpisodeFromJson(Map<String, dynamic> json) {
  return FavouriteEpisode(
    showName: json['showName'] as String,
    episodeId: json['episodeId'] as int,
    episodeNumber: json['episodeNumber'] as int,
    seasonId: json['seasonId'] as int,
    showId: json['showId'] as int,
  );
}

Map<String, dynamic> _$FavouriteEpisodeToJson(FavouriteEpisode instance) =>
    <String, dynamic>{
      'episodeId': instance.episodeId,
      'episodeNumber': instance.episodeNumber,
      'seasonId': instance.seasonId,
      'showId': instance.showId,
      'showName': instance.showName,
    };
