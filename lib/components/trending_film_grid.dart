import 'package:bshare/components/film_card.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class TrendingFilmGrid extends StatelessWidget {
  const TrendingFilmGrid({
    Key key,
    @required Api api,
  })  : _api = api,
        super(key: key);

  final Api _api;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _api.getTrendingFilms(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2.0, crossAxisCount: 2, childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return FilmCard(
                context,
                (snapshot.data[index]),
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
