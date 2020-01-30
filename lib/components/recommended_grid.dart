import 'package:bshare/components/film_card.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class RecommendedGrid extends StatelessWidget {
  const RecommendedGrid({
    Key key,
    @required Api api,
    @required this.film,
  })  : _api = api,
        super(key: key);

  final Api _api;
  final Film film;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: FutureBuilder(
      future: _api.getRecommendations(film.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2.0, crossAxisCount: 3, childAspectRatio: 0.6),
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
    ));
  }
}
