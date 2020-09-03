import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/actor_participation.dart';
import 'package:yshare/domain/repository/actor_participation/actor_participation_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';

class ActorParticipationImplementationRepository
    extends ActorParticipationAbstractRepository {
  final connection = DioSingletonProvider.getConnection;
  @override
  Future<ActorParticipation> getActorParticipation(String actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId/movie_credits$API_KEY&language=en-US';
    final response = await connection.request(_endpoint);
    return ActorParticipation.fromJson(response.data);
  }
}
