import 'package:bshare/model/film.dart';
import 'package:flutter/material.dart';

class FilmSynopsis extends StatelessWidget {
  const FilmSynopsis({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Text(
            'Synopsis',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${film.overview}',
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white),
          ),
        ]));
  }
}
