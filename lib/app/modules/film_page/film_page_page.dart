import 'package:yshare/app/modules/film_page/widgets/film_info.dart';
import 'package:yshare/app/modules/film_page/widgets/film_overview_widget.dart';
import 'package:yshare/app/modules/film_page/widgets/film_page_app_bar.dart';
import 'package:yshare/app/modules/film_page/widgets/film_page_crew_list.dart';
import 'package:yshare/app/modules/film_page/widgets/film_recommendation_list.dart';
import 'package:yshare/app/modules/film_page/widgets/genres_chip_list.dart';
import 'package:yshare/components/cast_horizontal_list.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/usecases/film/get_film_by_id_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'film_page_controller.dart';

class FilmPagePage extends StatefulWidget {
  final String title;
  final String id;

  FilmPagePage({
    Key key,
    @required this.id,
    this.title = 'FilmPage',
  }) : super(key: key);
  @override
  _FilmPagePageState createState() => _FilmPagePageState();
}

class _FilmPagePageState
    extends ModularState<FilmPagePage, FilmPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Film>(
        future: GetFilmByIdUsecase(
          id: widget.id,
          repository: controller.repository,
        )(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Without Internet access'),
              );
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.data is Film) {
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    FilmPageAppBar(
                      controller: controller,
                      film: snapshot.data,
                    ),
                    FilmInfo(film: snapshot.data),
                    GenresChipList(film: snapshot.data),
                    FilmOverviewWidget(film: snapshot.data),
                    CastHorizontalList(
                      film: snapshot.data,
                      repository: controller.filmCreditRepository,
                    ),
                    FilmPageCrewList(
                      id: snapshot.data.id.toString(),
                      repository: controller.filmCreditRepository,
                    ),
                    FilmRecommendationList(
                      controller: controller,
                      id: widget.id,
                      color: Colors.green[800],
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('Something wrong happened'),
                );
              }
              break;
            default:
              return Center(
                child: Text('Something wrong happened'),
              );
          }
        },
      ),
    );
  }
}
