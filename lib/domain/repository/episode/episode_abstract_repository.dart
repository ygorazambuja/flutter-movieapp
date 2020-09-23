import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/domain/entities/favourite_episode.dart';

abstract class EpisodeAbstractRepository {
  Future<Episode> getEpisodeDetails(FavouriteEpisode favouriteEpisode);
}
