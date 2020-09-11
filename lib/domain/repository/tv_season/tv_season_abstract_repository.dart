import 'package:yshare/domain/entities/season_details.dart';

abstract class TvSeasonAbstractRepository {
  Future<SeasonDetails> getSeasonDetails({String showId, String seasonId});
}
