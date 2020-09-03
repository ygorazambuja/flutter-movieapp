import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetFilmByGenreUsecase {
  final String genreId;
  final int page;
  final FilmAbstractRepository repository;

  GetFilmByGenreUsecase({
    @required this.genreId,
    @required this.page,
    @required this.repository,
  });

  Future<List<Film>> call() async {
    return await repository.getFilmByGenre(genreId, page);
  }
}
