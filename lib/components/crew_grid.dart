import 'package:bshare/model/film.dart';
import 'package:bshare/model/film_credit.dart';
import 'package:bshare/pages/actor_page.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class CrewGrid extends StatelessWidget {
  const CrewGrid({
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
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Crew',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FutureBuilder<FilmCredit>(
              future: _api.getFilmCredits(film.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      itemCount: snapshot.data.crew.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(12.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          childAspectRatio: 1,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final actorDetails = await _api
                                .getActorDetails(snapshot.data.crew[index].id);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ActorPage(actorDetails);
                            }));
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${snapshot.data.crew[index].profilePath}',
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
