import 'package:flutter/foundation.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';
import 'package:yshare/domain/repository/actor_participation/actor_participation_abstract_repository.dart';
import 'package:yshare/domain/repository/tv_participation/tv_participation_abstract_repository.dart';

part 'actor_page_controller.g.dart';

class ActorPageController = _ActorPageControllerBase with _$ActorPageController;

abstract class _ActorPageControllerBase with Store {
  final AppController appController;
  final ActorDetailsAbstractRepository actorDetailsRepository;
  final ActorParticipationAbstractRepository actorParticipationRepository;
  final TvParticipationAbstractRepository tvRepository;

  _ActorPageControllerBase({
    @required this.tvRepository,
    @required this.actorParticipationRepository,
    @required this.appController,
    @required this.actorDetailsRepository,
  });
}
