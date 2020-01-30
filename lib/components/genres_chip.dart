import 'package:bshare/model/film.dart';
import 'package:bshare/pages/genre_page.dart';
import 'package:flutter/material.dart';

class GenresChips extends StatelessWidget {
  const GenresChips({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('Genres'.toUpperCase(),
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
        ),
        Container(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.all(5.0),
            itemBuilder: (context, index) {
              return ActionChip(
                label: Text(
                  '${film.genreIds[index].name}',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenrePage(
                              film.genreIds[index].id,
                              film.genreIds[index].name)));
                },
                padding: EdgeInsets.all(2.0),
              );
            },
            itemCount: film.genreIds.length,
          ),
        )
      ],
    );
  }
}
