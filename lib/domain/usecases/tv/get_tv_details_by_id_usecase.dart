import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

class GetTvDetailsByIdUsecase {
  final TvAbstractRepository repository;
  final String id;

  GetTvDetailsByIdUsecase({
    @required this.repository,
    @required this.id,
  });

  Future<TvDetails> call() async {
    return await repository.getTvDetailsById(id);
  }
}
