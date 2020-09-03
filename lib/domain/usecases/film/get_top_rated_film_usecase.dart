import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetTopRatedFilmUsecase {
  final int page;
  final FilmAbstractRepository repository;

  GetTopRatedFilmUsecase({
    @required this.page,
    @required this.repository,
  });
  Future<List<Film>> call() async {
    return await repository.getTopRated(page);
  }
}
