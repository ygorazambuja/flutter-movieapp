import 'package:yshare/domain/entities/tv_participation.dart';

abstract class TvParticipationAbstractRepository {
  Future<List<TvParticipation>> getPersonTvParticipation(String personId);
}
