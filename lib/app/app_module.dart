import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/app_widget.dart';
import 'package:yshare/app/modules/actor_page/actor_page_page.dart';
import 'package:yshare/app/modules/film_page/film_page_controller.dart';
import 'package:yshare/app/modules/film_page/film_page_page.dart';
import 'package:yshare/app/modules/genre_page/genre_page_page.dart';
import 'package:yshare/app/modules/home/home_module.dart';
import 'package:yshare/app/modules/popular_page/popular_page_page.dart';
import 'package:yshare/app/modules/search_page/search_page_page.dart';
import 'package:yshare/app/modules/season_page/season_page_controller.dart';
import 'package:yshare/app/modules/season_page/season_page_page.dart';
import 'package:yshare/app/modules/top_rated_page/top_rated_page_page.dart';
import 'package:yshare/app/modules/trending_page/trending_page_page.dart';
import 'package:yshare/app/modules/tv_page/tv_page_page.dart';
import 'package:yshare/infra/repository/actor_details/actor_details_implementation_repository.dart';
import 'package:yshare/infra/repository/actor_participation/actor_participation_implementation_repository.dart';
import 'package:yshare/infra/repository/film/film_implementation_repository.dart';
import 'package:yshare/infra/repository/film_credit/film_credit_implementation_repository.dart';
import 'package:yshare/infra/repository/tv/tv_implementation_repository.dart';
import 'package:yshare/infra/repository/tv_participation/tv_participation_implementation_repository.dart';
import 'package:yshare/infra/repository/tv_season/tv_season_implementation_repository.dart';

import 'app_controller.dart';
import 'modules/actor_page/actor_page_controller.dart';
import 'modules/genre_page/genre_page_controller.dart';
import 'modules/popular_page/popular_page_controller.dart';
import 'modules/search_page/search_page_controller.dart';
import 'modules/top_rated_page/top_rated_page_controller.dart';
import 'modules/trending_page/trending_page_controller.dart';
import 'modules/tv_page/tv_page_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SeasonPageController(
            appController: i.get<AppController>(),
            repository: TvSeasonImplementationRepository())),
        Bind(
          (i) => FilmPageController(
            appController: i.get<AppController>(),
            repository: FilmImplementationRepository(),
            filmCreditRepository: FilmCreditImplementationRepository(),
          ),
        ),
        Bind(
          (i) => TvPageController(
              appController: i.get<AppController>(),
              repository: TvImplementationRepository()),
        ),
        Bind(
          (i) => TopRatedPageController(
              appController: i.get<AppController>(),
              repository: FilmImplementationRepository()),
        ),
        Bind(
          (i) => PopularPageController(
              appController: i.get<AppController>(),
              repository: FilmImplementationRepository()),
        ),
        Bind(
          (i) => TrendingPageController(
              i.get<AppController>(), FilmImplementationRepository()),
        ),
        Bind(
          (i) => SearchPageController(
              appController: i.get<AppController>(),
              repository: FilmImplementationRepository()),
        ),
        Bind(
          (i) => ActorPageController(
              appController: i.get<AppController>(),
              actorDetailsRepository: ActorDetailsImplementationRepository(),
              actorParticipationRepository:
                  ActorParticipationImplementationRepository(),
              tvRepository: TvParticipationImplementationRepository()),
        ),
        Bind(
          (i) => GenrePageController(
            appController: i.get<AppController>(),
            repository: FilmImplementationRepository(),
          ),
        ),
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
        ),
        ModularRouter(
          '/actorPage/:id',
          child: (context, args) => ActorPagePage(
            id: args.params['id'],
          ),
        ),
        ModularRouter(
          '/searchFilmPage/:name',
          child: (context, args) => SearchPagePage(
            name: args.params['name'],
          ),
        ),
        ModularRouter(
          '/trendingFilms',
          child: (context, args) => TrendingPagePage(),
        ),
        ModularRouter(
          '/popularFilms',
          child: (context, args) => PopularPagePage(),
        ),
        ModularRouter(
          '/topRatedFilms',
          child: (context, args) => TopRatedPagePage(),
        ),
        ModularRouter(
          '/tvPage/:id',
          child: (context, args) => TvPagePage(id: args.params['id']),
        ),
        ModularRouter('/tvPage/:showId/season/:seasonId',
            child: (context, args) => SeasonPagePage(
                showId: args.params['showId'],
                seasonId: args.params['seasonId'])),
      ];

  @override
  Widget get bootstrap => AppWidget(
        controller: to.get<AppController>(),
      );

  static Inject get to => Inject<AppModule>.of();
}
