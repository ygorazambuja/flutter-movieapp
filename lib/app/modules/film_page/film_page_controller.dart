import 'package:flutter/foundation.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/repository/film_credit/film_credit_abstract_repository.dart';

part 'film_page_controller.g.dart';

class FilmPageController = _FilmPageControllerBase with _$FilmPageController;

abstract class _FilmPageControllerBase with Store {
  final AppController appController;
  final FilmAbstractRepository repository;
  final FilmCreditAbstractRepository filmCreditRepository;

  _FilmPageControllerBase({
    @required this.filmCreditRepository,
    @required this.repository,
    @required this.appController,
  });
}
