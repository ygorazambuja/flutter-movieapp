import 'package:mobx/mobx.dart';

part 'genre_page_controller.g.dart';

class GenrePageController = _GenrePageControllerBase with _$GenrePageController;

abstract class _GenrePageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
