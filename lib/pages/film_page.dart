import 'package:bshare/components/recommended_grid.dart';
import 'package:bshare/components/crew_grid.dart';
import 'package:bshare/components/cast_grid.dart';
import 'package:bshare/components/film_synopsis.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/components/film_header.dart';
import 'package:bshare/components/genres_chip.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatelessWidget {
  final Film film;
  final Api _api = Api();
  FilmPage(this.film) {
    print(film.voteAverage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('${film.originalTitle}'),
              backgroundColor: Colors.black26,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                FilmHeader(film: film),
                GenresChips(film: film),
                FilmSynopsis(film: film),
              ]),
            ),
            CastGrid(api: _api, film: film),
            CrewGrid(api: _api, film: film),
            RecommendedGrid(api: _api, film: film),
          ],
        ));
  }
}
