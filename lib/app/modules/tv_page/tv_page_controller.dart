import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

part 'tv_page_controller.g.dart';

class TvPageController = _TvPageControllerBase with _$TvPageController;

abstract class _TvPageControllerBase with Store {
  final AppController appController;
  final TvAbstractRepository repository;

  _TvPageControllerBase({
    @required this.repository,
    @required this.appController,
  });
}
