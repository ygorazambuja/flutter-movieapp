import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/entities/tv.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';
import 'package:yshare/shared/constants.dart';

class FilmImplementationRepository extends FilmAbstractRepository {
  final connection = DioSingletonProvider.getConnection;

  @override
  Future<List<Film>> getFilmByGenre(String genreId, int page) async {
    final _endpoint = '$GENRE_SEARCH$genreId$PAGE$page';

    final response = await connection.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  @override
  Future<Film> getFilmById(String id) async {
    final _endpoint = '$MOVIE_BASE_URL$id$API_KEY';
    final response = await connection.get(_endpoint);
    return Film.fromJson(response.data);
  }

  @override
  Future<List<Film>> getPopular(int page) async {
    final _endpoint = '$POPULAR_MOVIE$API_KEY$PAGE$page';
    final response = await connection.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  @override
  Future<List<Film>> getRecommendations(String id, int page) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$id/recommendations$API_KEY&language=en-US&page=$page';

    final response = await connection.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  @override
  Future<List<Film>> getTopRated(int page) async {
    final _endpoint = '$TOP_RATED$API_KEY$PAGE$page';
    final response = await connection.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  @override
  Future<List<Film>> getTrendingFilms(int page) async {
    final _endpoint = '$TRENDING_MOVIE$API_KEY$PAGE$page';
    final response = await connection.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  @override
  Future<List<Map<String, dynamic>>> multiSearch(String param, int page) async {
    final _endpoint =
        'https://api.themoviedb.org/3/search/multi$API_KEY&language=en-US$QUERY$param$PAGE$page';
    final response = await connection.request(_endpoint);

    var resultSearch = <Map<String, dynamic>>[];

    for (Map<String, dynamic> json in response.data['results']) {
      if (json['media_type'] == 'tv') {
        resultSearch.add(Tv.fromJson(json).toJson());
      }

      if (json['media_type'] == 'movie') {
        resultSearch.add(Film.fromJson(json).toJson());
      }
      if (json['known_for_department'] != null) {
        resultSearch.add(ActorDetails.fromJson(json).toJson());
      }
    }
    return resultSearch;
  }
}
