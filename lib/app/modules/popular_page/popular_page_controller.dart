import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/usecases/film/get_popular_film_usecase.dart';

part 'popular_page_controller.g.dart';

class PopularPageController = _PopularPageControllerBase
    with _$PopularPageController;

abstract class _PopularPageControllerBase with Store {
  final AppController appController;
  _PopularPageControllerBase(
      {@required this.appController, @required this.repository});
  final FilmAbstractRepository repository;

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchPopularFilms() async {
    var response =
        await GetPopularFilmUsecase(page: actualPage, repository: repository)();
    for (var film in response) {
      films.add(film);
    }
  }
}
