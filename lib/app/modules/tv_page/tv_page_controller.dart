import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';

part 'tv_page_controller.g.dart';

class TvPageController = _TvPageControllerBase with _$TvPageController;

abstract class _TvPageControllerBase with Store {
  final AppController appController;
  _TvPageControllerBase({
    this.appController,
  });
}
