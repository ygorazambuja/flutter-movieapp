import 'package:bshare/model/actor_details.dart';
import 'package:bshare/model/actor_participation.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/model/film_credit.dart';
import 'package:bshare/provider/constants.dart';
import 'package:dio/dio.dart';

class Api {
  final Dio _client = Dio();

  Future<Film> getFilmById(int id) async {
    final _endpoint = '$MOVIE_BASE_URL$id$API_KEY';
    final response = await _client.get(_endpoint);
    return Film.fromJson(response.data);
  }

  Future<List<Film>> getTrendingFilms() async {
    final _endpoint = '$TRENDING_MOVIE$API_KEY';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getFilmByGenre(String genreId, [page = 1]) async {
    final _endpoint = '$GENRE_SEARCH$genreId$page';

    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getRecommendations(int filmId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/recommendations?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US&page=1';

    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<FilmCredit> getFilmCredits(int filmId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/credits?api_key=ab319f50a3792c49e23a3336df9f0d80';

    final response = await _client.request(_endpoint);
    return FilmCredit.fromJson(response.data);
  }

  Future<ActorDetails> getActorDetails(int actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US';
    final response = await _client.request(_endpoint);
    return ActorDetails.fromJson(response.data);
  }

  Future<ActorParticipation> getActorParticipation(int actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId/movie_credits?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US';
    final response = await _client.request(_endpoint);
    return ActorParticipation.fromJson(response.data);
  }

  Future<List<Film>> searchFilm(String searchParam) async {
    final _endpoint = '$SEARCH_MOVIE$API_KEY$QUERY$searchParam';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      var film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getPopular([page = 1]) async {
    final _endpoint = '$POPULAR_MOVIE$API_KEY$PAGE';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<List<Film>> getTopRated([page = 1]) async {
    final _endpoint = '$TOP_RATED$API_KEY$PAGE';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }
}
