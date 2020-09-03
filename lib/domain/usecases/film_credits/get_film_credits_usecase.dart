import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/film_credit.dart';
import 'package:yshare/domain/repository/film_credit/film_credit_abstract_repository.dart';

class GetFilmCreditsUsecase {
  final String filmId;
  final FilmCreditAbstractRepository repository;

  GetFilmCreditsUsecase({
    @required this.filmId,
    @required this.repository,
  });

  Future<FilmCredit> call() async {
    return await repository.getFilmCredits(filmId);
  }
}
