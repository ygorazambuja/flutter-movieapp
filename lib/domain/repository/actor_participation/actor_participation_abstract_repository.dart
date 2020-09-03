import 'package:yshare/domain/entities/actor_participation.dart';

abstract class ActorParticipationAbstractRepository {
  Future<ActorParticipation> getActorParticipation(String actorId);
}
