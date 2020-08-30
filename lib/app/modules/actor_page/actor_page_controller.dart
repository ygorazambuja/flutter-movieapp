import 'package:bshare/app/app_controller.dart';
import 'package:bshare/model/actor_details.dart';
import 'package:bshare/model/actor_participation.dart';
import 'package:bshare/provider/api.dart';
import 'package:mobx/mobx.dart';

part 'actor_page_controller.g.dart';

class ActorPageController = _ActorPageControllerBase with _$ActorPageController;

abstract class _ActorPageControllerBase with Store {
  final AppController appController;

  _ActorPageControllerBase(this.appController);
}
