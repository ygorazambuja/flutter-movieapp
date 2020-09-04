import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'season_page_controller.g.dart';

@Injectable()
class SeasonPageController = _SeasonPageControllerBase
    with _$SeasonPageController;

abstract class _SeasonPageControllerBase with Store {}
