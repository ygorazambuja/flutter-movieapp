import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/usecases/film/get_film_by_genre_usecase.dart';
import 'package:mobx/mobx.dart';

part 'genre_page_controller.g.dart';

class GenrePageController = _GenrePageControllerBase with _$GenrePageController;

abstract class _GenrePageControllerBase with Store {
  final AppController appController;
  final FilmAbstractRepository repository;

  _GenrePageControllerBase({this.appController, this.repository});

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  int actualPage = 1;

  @observable
  String genreId;

  @observable
  String genreName;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  void setGenreId(genreId) => this.genreId = genreId;

  @action
  void setGenreName(genreName) => this.genreName = genreName;

  @action
  Future<void> fetchFilmsByGenre() async {
    var response = await GetFilmByGenreUsecase(
        genreId: genreId, page: actualPage, repository: repository)();
    print(response);
    for (var film in response) {
      films.add(film);
    }
  }
}
