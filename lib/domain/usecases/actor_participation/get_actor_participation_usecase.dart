import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/actor_participation.dart';
import 'package:yshare/domain/repository/actor_participation/actor_participation_abstract_repository.dart';

class GetActorParticipationUsecase {
  final String actorId;
  final ActorParticipationAbstractRepository repository;

  GetActorParticipationUsecase({
    @required this.actorId,
    @required this.repository,
  });

  Future<ActorParticipation> call() async {
    return await repository.getActorParticipation(actorId);
  }
}
