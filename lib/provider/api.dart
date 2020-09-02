import 'package:dio/dio.dart';
import 'package:yshare/model/actor_details.dart';
import 'package:yshare/model/actor_participation.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/model/film_credit.dart';
import 'package:yshare/model/tv.dart';
import 'package:yshare/model/tv_participation.dart';
import 'package:yshare/provider/constants.dart';

class Api {
  final Dio _client = Dio();

  Future<Film> getFilmById(String id) async {
    final _endpoint = '$MOVIE_BASE_URL$id$API_KEY';
    final response = await _client.get(_endpoint);
    return Film.fromJson(response.data);
  }

  Future<List<Film>> getTrendingFilms([page = 1]) async {
    final _endpoint = '$TRENDING_MOVIE$API_KEY$PAGE$page';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getFilmByGenre(String genreId, [page = 1]) async {
    final _endpoint = '$GENRE_SEARCH$genreId$PAGE$page';

    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getRecommendations(String filmId, [page = 1]) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/recommendations?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US&page=$page';

    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<FilmCredit> getFilmCredits(String filmId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/movie/$filmId/credits$API_KEY$LANGUAGE';
    final response = await _client.request(_endpoint);
    return FilmCredit.fromJson(response.data);
  }

  Future<ActorDetails> getActorDetails(String actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId$API_KEY&language=en-US';
    final response = await _client.request(_endpoint);
    return ActorDetails.fromJson(response.data);
  }

  Future<ActorParticipation> getActorParticipation(String actorId) async {
    final _endpoint =
        'https://api.themoviedb.org/3/person/$actorId/movie_credits$API_KEY&language=en-US';

    final response = await _client.request(_endpoint);

    return ActorParticipation.fromJson(response.data);
  }

  Future<List<Film>> searchFilm(String searchParam, [page = 1]) async {
    final _endpoint = '$SEARCH_MOVIE$API_KEY$QUERY$searchParam$PAGE$page';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      var film = Film.fromJson(json);
      films.add(film);
    }

    return films;
  }

  Future<List<Film>> getPopular([page = 1]) async {
    final _endpoint = '$POPULAR_MOVIE$API_KEY$PAGE$page';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<List<Film>> getTopRated([page = 1]) async {
    final _endpoint = '$TOP_RATED$API_KEY$PAGE$page';
    final response = await _client.request(_endpoint);
    final films = <Film>[];

    for (Map<String, dynamic> json in response.data['results']) {
      final film = Film.fromJson(json);
      films.add(film);
    }
    return films;
  }

  Future<List<TvParticipation>> getPersonTvParticipations(
      String personId) async {
    final _endpoint = '$PERSON_ENDPOINT$personId/tv_credits$API_KEY$LANGUAGE';
    final response = await _client.request(_endpoint);
    final tvParticipations = <TvParticipation>[];

    for (Map<String, dynamic> json in response.data['cast']) {
      var tv = TvParticipation.fromJson(json);
      tvParticipations.add(tv);
    }
    return tvParticipations;
  }

  Future<List<Map<String, dynamic>>> multiSearch(query, [page = 1]) async {
    final _endpoint =
        'https://api.themoviedb.org/3/search/multi?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US$QUERY$query$PAGE$page';
    final response = await _client.request(_endpoint);

    var resultSearch = <Map<String, dynamic>>[];

    for (Map<String, dynamic> json in response.data['results']) {
      if (json['media_type'] == 'tv') {
        resultSearch.add(Tv.fromJson(json).toJson());
      }

      if (json['media_type'] == 'movie') {
        resultSearch.add(Film.fromJson(json).toJson());
      }
    }
    return resultSearch;
  }
}
