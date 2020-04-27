import 'package:bshare/model/film.dart';
import 'package:bshare/pages/film_page.dart';
import 'package:bshare/provider/api.dart';
import 'package:bshare/provider/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  final Api api = Api();
  FilmCard(context, this.film);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            color: Colors.black87,
            child: Column(
              children: <Widget>[
                film.posterPath != null
                    ? Image.network(
                        '$IMAGE_BASE_URL${film.posterPath}',
                        fit: BoxFit.fitWidth,
                      )
                    : null,
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: RatingBar(
                      initialRating: (film.voteAverage / 2),
                      ignoreGestures: true,
                      itemSize: 12,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ))
              ],
            )),
        onTap: () async {
          Film newFilm = await api.getFilmById(film.id);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FilmPage(newFilm)));
        });
  }
}
