import 'package:yshare/domain/entities/tv_participation.dart';
import 'package:yshare/domain/repository/tv_participation/tv_participation_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';
import 'package:yshare/shared/constants.dart';

class TvParticipationImplementationRepository
    extends TvParticipationAbstractRepository {
  final connection = DioSingletonProvider.getConnection;
  @override
  Future<List<TvParticipation>> getPersonTvParticipation(
      String personId) async {
    final _endpoint = '$PERSON_ENDPOINT$personId/tv_credits$API_KEY$LANGUAGE';
    final response = await connection.request(_endpoint);
    final tvParticipations = <TvParticipation>[];

    for (Map<String, dynamic> json in response.data['cast']) {
      var tv = TvParticipation.fromJson(json);
      tvParticipations.add(tv);
    }
    return tvParticipations;
  }
}
