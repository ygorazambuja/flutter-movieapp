import 'package:yshare/domain/entities/film.dart';

abstract class FilmAbstractRepository {
  Future<Film> getFilmById(String id);
  Future<List<Film>> getTrendingFilms(int page);
  Future<List<Film>> getFilmByGenre(String genreId, int page);
  Future<List<Film>> getRecommendations(String id, int page);
  Future<List<Film>> getPopular(int page);
  Future<List<Film>> getTopRated(int page);
  Future<List<Map<String, dynamic>>> multiSearch(String param, int page);
}
