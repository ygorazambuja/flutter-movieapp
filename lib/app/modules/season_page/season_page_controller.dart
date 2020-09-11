import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/repository/tv_season/tv_season_abstract_repository.dart';

part 'season_page_controller.g.dart';

@Injectable()
class SeasonPageController = _SeasonPageControllerBase
    with _$SeasonPageController;

abstract class _SeasonPageControllerBase with Store {
  final AppController appController;
  final TvSeasonAbstractRepository repository;
  _SeasonPageControllerBase({
    @required this.appController,
    @required this.repository,
  });
}
