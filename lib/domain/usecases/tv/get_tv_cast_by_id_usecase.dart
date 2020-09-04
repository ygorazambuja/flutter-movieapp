import 'package:flutter/material.dart';
import 'package:yshare/domain/entities/cast.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

class GetTvCastByIdUsecase {
  final TvAbstractRepository repository;
  final String id;

  GetTvCastByIdUsecase({@required this.repository, @required this.id});

  Future<List<Cast>> call() async {
    return await repository.getTvCasting(id);
  }
}
