import 'package:flutter/foundation.dart';
import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/season_details.dart';
import 'package:yshare/domain/repository/tv_season/tv_season_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';

class TvSeasonImplementationRepository extends TvSeasonAbstractRepository {
  @override
  Future<SeasonDetails> getSeasonDetails(
      {@required String showId, @required String seasonId}) async {
    var _endpoint =
        'https://api.themoviedb.org/3/tv/$showId/season/$seasonId$API_KEY&language=en-US';
    final response = await DioSingletonProvider.getConnection.get(_endpoint);
    return SeasonDetails.fromJson(response.data);
  }
}
