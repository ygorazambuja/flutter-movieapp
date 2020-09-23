import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/domain/entities/favourite_episode.dart';
import 'package:yshare/domain/repository/episode/episode_abstract_repository.dart';

class GetEpisodeDetailsUsecase {
  final FavouriteEpisode favouriteEpisode;
  final EpisodeAbstractRepository repository;

  GetEpisodeDetailsUsecase({
    @required this.favouriteEpisode,
    @required this.repository,
  });

  Future<Episode> call() async {
    return await repository.getEpisodeDetails(favouriteEpisode);
  }
}
