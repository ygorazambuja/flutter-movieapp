import 'package:bshare/model/film.dart';
import 'package:flutter/material.dart';

import 'card_film.dart';

class FilmHorizontalList extends StatelessWidget {
  const FilmHorizontalList({
    Key key,
    @required this.films,
  }) : super(key: key);

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: films.length,
            itemBuilder: (context, index) {
              var film = films[index];
              return CardFilm(film: film);
            }),
      ),
    );
  }
}
