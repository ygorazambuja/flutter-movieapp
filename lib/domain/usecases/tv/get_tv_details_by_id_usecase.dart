import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/tv.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

class GetTvDetailsByIdUsecase {
  final TvAbstractRepository repository;
  final String id;

  GetTvDetailsByIdUsecase({
    @required this.repository,
    @required this.id,
  });

  Future<Tv> call() async {
    return await repository.getTvDetailsById(id);
  }
}
