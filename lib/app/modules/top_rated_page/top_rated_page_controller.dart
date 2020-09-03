import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/usecases/film/get_top_rated_film_usecase.dart';

part 'top_rated_page_controller.g.dart';

class TopRatedPageController = _TopRatedPageControllerBase
    with _$TopRatedPageController;

abstract class _TopRatedPageControllerBase with Store {
  final AppController appController;
  final FilmAbstractRepository repository;

  _TopRatedPageControllerBase(
      {@required this.appController, @required this.repository});

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchTopRated() async {
    var response = await GetTopRatedFilmUsecase(
        page: actualPage, repository: repository)();
    for (var film in response) {
      films.add(film);
    }
  }
}
