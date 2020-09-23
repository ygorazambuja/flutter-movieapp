import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/domain/entities/favourite_episode.dart';
import 'package:yshare/domain/repository/episode/episode_abstract_repository.dart';

import '../../dio_singleton_provider.dart';

class EpisodeImplementationRepository extends EpisodeAbstractRepository {
  final connection = DioSingletonProvider.getConnection;

  @override
  Future<Episode> getEpisodeDetails(FavouriteEpisode favouriteEpisode) async {
    final _endpoint =
        'https://api.themoviedb.org/3/tv/${favouriteEpisode.showId}/season/${favouriteEpisode.seasonId}/episode/${favouriteEpisode.episodeNumber}$API_KEY&language=en-US';
    final response = await connection.request(_endpoint);
    return Episode.fromJson(response.data);
  }
}
