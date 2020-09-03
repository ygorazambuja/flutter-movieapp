import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/usecases/film/get_trending_films_usecase.dart';

part 'trending_page_controller.g.dart';

class TrendingPageController = _TrendingPageControllerBase
    with _$TrendingPageController;

abstract class _TrendingPageControllerBase with Store {
  final AppController appController;
  final FilmAbstractRepository repository;

  _TrendingPageControllerBase(this.appController, this.repository);

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchTredingFilms() async {
    var response = await GetTrendingFilmsUsecase(
        page: actualPage, repository: repository)();
    for (var film in response) {
      films.add(film);
    }
  }
}
