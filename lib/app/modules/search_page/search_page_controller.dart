import 'package:flutter/foundation.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/usecases/film/multi_search_usecase.dart';
import 'package:mobx/mobx.dart';

part 'search_page_controller.g.dart';

class SearchPageController = _SearchPageControllerBase
    with _$SearchPageController;

abstract class _SearchPageControllerBase with Store {
  final AppController appController;
  final FilmAbstractRepository repository;

  _SearchPageControllerBase(
      {@required this.appController, @required this.repository});

  @observable
  String searchName;

  @observable
  ObservableList<Map<String, dynamic>> films =
      ObservableList<Map<String, dynamic>>();

  @observable
  int actualPage = 1;

  @action
  void setSearchName(String searchName) => this.searchName = searchName;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchMultiSearch() async {
    var response = await MultiSearchUsecase(
        page: actualPage, repository: repository, searchParam: searchName)();
    for (var film in response) {
      films.add(film);
    }
  }
}
