import 'package:bshare/model/actor_details.dart';
import 'package:bshare/model/actor_participation.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/model/film_credit.dart';
import 'package:bshare/provider/constants.dart';
import 'package:dio/dio.dart';

class Api {
  Dio _client = Dio();

  Future<Film> getFilmById(int id) async {
    final _endpoint = '$MOVIE_BASE_URL$id$API_KEY';
    Response response = await _client.get(_endpoint);
    Film film = Film.fromJson(response.data);
    return film;
  }

  Future<List<Film>> getTrendingFilms() async {
    final _endpoint = '$TRENDING_MOVIE$API_KEY';
    Response response = await _client.request(_endpoint);
    List<Film> films = List<Film>();

    for (Map<String, dynamic> json in response.data['results']) {
      Film film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getFilmByGenre(int genreId) async {
    final _endpoint = '$GENRE_SEARCH$genreId';

    Response response = await _client.request(_endpoint);
    List<Film> films = List<Film>();

    for (Map<String, dynamic> json in response.data['results']) {
      Film film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getRecommendations(int filmId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/recommendations?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US&page=1';

    Response response = await _client.request(_endpoint);
    List<Film> films = List<Film>();

    for (Map<String, dynamic> json in response.data['results']) {
      Film film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<FilmCredit> getFilmCredits(int filmId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/credits?api_key=ab319f50a3792c49e23a3336df9f0d80';

    Response response = await _client.request(_endpoint);
    FilmCredit filmCredit = FilmCredit.fromJson(response.data);
    return filmCredit;
  }

  Future<ActorDetails> getActorDetails(int actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US';
    Response response = await _client.request(_endpoint);
    ActorDetails actorDetails = ActorDetails.fromJson(response.data);
    return actorDetails;
  }

  Future<ActorParticipation> getActorParticipation(int actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId/movie_credits?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US';
    Response response = await _client.request(_endpoint);
    ActorParticipation actorParticipation =
        ActorParticipation.fromJson(response.data);

    return actorParticipation;
  }

  Future<List<Film>> searchFilm(String searchParam) async {
    final _endpoint = '$SEARCH_MOVIE$API_KEY$QUERY$searchParam';
    Response response = await _client.request(_endpoint);
    List<Film> films = List<Film>();

    for (Map<String, dynamic> json in response.data['results']) {
      Film film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }
}
