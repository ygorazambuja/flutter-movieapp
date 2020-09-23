import 'package:yshare/api_key.dart';
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

  @override
  Future<List<ActorDetails>> getPopularActors(int page) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/popular$API_KEY&language=en-US$PAGE$page';
    final response = await connection.request(_endpoint);
    final actors = <ActorDetails>[];

    for (var json in response.data['results']) {
      actors.add(ActorDetails.fromJson(json));
    }

    return actors;
  }
}
