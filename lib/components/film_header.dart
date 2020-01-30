import 'package:bshare/model/film.dart';
import 'package:bshare/provider/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilmHeader extends StatelessWidget {
  const FilmHeader({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Card(
            child: Image.network(
              '$IMAGE_BASE_URL${film.posterPath}',
              height: 250,
            ),
            elevation: 10,
          )),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          film.originalTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          film.tagline,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.white),
        ),
      ),

    ]);
  }
}
