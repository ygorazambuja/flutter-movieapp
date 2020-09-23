import 'package:yshare/domain/entities/actor_details.dart';

abstract class ActorDetailsAbstractRepository {
  Future<ActorDetails> getActorDetails(String actorId);
  Future<List<ActorDetails>> getPopularActors(int page);
}
