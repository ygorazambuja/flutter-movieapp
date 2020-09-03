import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/tv_participation.dart';
import 'package:yshare/domain/repository/tv_participation/tv_participation_abstract_repository.dart';

class GetPersonTvParticipationUsecase {
  final String personId;
  final TvParticipationAbstractRepository repository;

  GetPersonTvParticipationUsecase({
    @required this.personId,
    @required this.repository,
  });
  Future<List<TvParticipation>> call() async {
    return await repository.getPersonTvParticipation(personId);
  }
}
