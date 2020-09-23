import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';

class GetPopularActorsUsecase {
  final ActorDetailsAbstractRepository repository;
  final int page;

  GetPopularActorsUsecase({@required this.repository, @required this.page});

  Future<List<ActorDetails>> call() async {
    return await repository.getPopularActors(page);
  }
}
