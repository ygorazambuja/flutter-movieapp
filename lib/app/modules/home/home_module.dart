import 'package:yshare/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/infra/repository/actor_details/actor_details_implementation_repository.dart';
import 'package:yshare/infra/repository/film/film_implementation_repository.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(
            appController: i.get<AppController>(),
            filmRepository: FilmImplementationRepository(),
            actorDetailsRepository: ActorDetailsImplementationRepository()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => HomePage(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
