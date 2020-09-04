import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/film_credit.dart';
import 'package:yshare/domain/repository/film_credit/film_credit_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';
import 'package:yshare/shared/constants.dart';

class FilmCreditImplementationRepository extends FilmCreditAbstractRepository {
  final connection = DioSingletonProvider.getConnection;

  @override
  Future<FilmCredit> getFilmCredits(String id) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$id/credits$API_KEY$LANGUAGE';
    final response = await connection.request(_endpoint);
    return FilmCredit.fromJson(response.data);
  }
}
