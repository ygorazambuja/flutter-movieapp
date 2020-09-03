import 'package:yshare/domain/entities/actor_details.dart';

abstract class ActorDetailsAbstractRepository {
  Future<ActorDetails> getActorDetails(String actorId);
}
