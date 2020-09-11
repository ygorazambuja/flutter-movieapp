import 'package:yshare/domain/entities/season_details.dart';
import 'package:yshare/domain/repository/tv_season/tv_season_abstract_repository.dart';

class GetSeasonDetailsUsecase {
  final TvSeasonAbstractRepository repository;
  final String showId;
  final String seasonId;

  GetSeasonDetailsUsecase({
    this.repository,
    this.showId,
    this.seasonId,
  });
  Future<SeasonDetails> call() async {
    return await repository.getSeasonDetails(
        seasonId: seasonId, showId: showId);
  }
}
