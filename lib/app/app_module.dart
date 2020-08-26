import 'package:bshare/app/modules/film_page/film_page_page.dart';
import 'package:bshare/app/modules/genre_page/genre_page_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:bshare/app/app_widget.dart';
import 'package:bshare/app/modules/home/home_module.dart';

import 'modules/film_page/film_page_controller.dart';
import 'modules/genre_page/genre_page_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GenrePageController()),
        Bind((i) => FilmPageController()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        ModularRouter(
          '/filmPage/:id',
          child: (context, args) => FilmPagePage(
            id: args.params['id'],
          ),
        ),
        ModularRouter(
          '/genrePage/:id',
          child: (context, args) => GenrePagePage(
            id: args.params['id'],
          ),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
