import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/app_controller.dart';

part 'drawer_page_controller.g.dart';

@Injectable()
class DrawerPageController = _DrawerPageControllerBase
    with _$DrawerPageController;

abstract class _DrawerPageControllerBase with Store {
  final AppController appController;

  _DrawerPageControllerBase(this.appController);
}
