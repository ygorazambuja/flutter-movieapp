import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetFilmByIdUsecase {
  final String id;
  final FilmAbstractRepository repository;

  GetFilmByIdUsecase({
    @required this.id,
    @required this.repository,
  });

  Future<Film> call() async {
    return await repository.getFilmById(id);
  }
}
