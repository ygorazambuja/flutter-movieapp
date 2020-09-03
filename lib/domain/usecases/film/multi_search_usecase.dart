import 'package:flutter/foundation.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class MultiSearchUsecase {
  final String searchParam;
  final int page;
  final FilmAbstractRepository repository;

  MultiSearchUsecase({
    @required this.searchParam,
    @required this.page,
    @required this.repository,
  });
  Future<List<Map<String, dynamic>>> call() async {
    return await repository.multiSearch(searchParam, page);
  }
}
