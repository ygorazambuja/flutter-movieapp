import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';
import 'package:yshare/shared/constants.dart';

class ActorDetailsImplementationRepository
    extends ActorDetailsAbstractRepository {
  final connection = DioSingletonProvider.getConnection;
  @override
  Future<ActorDetails> getActorDetails(String actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId$API_KEY&language=en-US';
    final response = await connection.request(_endpoint);
    return ActorDetails.fromJson(response.data);
  }
}
