import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetTrendingFilmsUsecase {
  final int page;
  final FilmAbstractRepository repository;

  GetTrendingFilmsUsecase({
    @required this.page,
    @required this.repository,
  });

  Future<List<Film>> call() async {
    return await repository.getTrendingFilms(page);
  }
}
