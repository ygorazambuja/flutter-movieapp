import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetPopularFilmUsecase {
  final int page;
  final FilmAbstractRepository repository;

  GetPopularFilmUsecase({
    @required this.page,
    @required this.repository,
  });

  Future<List<Film>> call() async {
    return await repository.getPopular(page);
  }
}
