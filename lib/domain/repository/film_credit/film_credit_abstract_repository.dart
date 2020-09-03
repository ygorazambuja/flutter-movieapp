import 'package:yshare/domain/entities/film_credit.dart';

abstract class FilmCreditAbstractRepository {
  Future<FilmCredit> getFilmCredits(String id);
}
