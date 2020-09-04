import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';

class GetActorDetailsUsecase {
  final String actorId;
  final ActorDetailsAbstractRepository repository;

  GetActorDetailsUsecase({
    @required this.actorId,
    @required this.repository,
  });

  Future<ActorDetails> call() async {
    return await repository.getActorDetails(actorId);
  }
}
