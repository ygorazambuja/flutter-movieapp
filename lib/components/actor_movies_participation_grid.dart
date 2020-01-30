import 'package:bshare/components/film_card.dart';
import 'package:bshare/model/actor_details.dart';
import 'package:bshare/model/actor_participation.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class ActorMoviesParticipationGrid extends StatelessWidget {
  const ActorMoviesParticipationGrid({
    Key key,
    @required Api api,
    @required this.actorDetails,
  })  : _api = api,
        super(key: key);

  final Api _api;
  final ActorDetails actorDetails;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          FutureBuilder<ActorParticipation>(
            future: _api.getActorParticipation(actorDetails.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(
                      'Participations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(10.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2.0,
                          crossAxisCount: 3,
                          childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        return snapshot.data.cast[index].posterPath != null
                            ? FilmCard(context, snapshot.data.cast[index])
                            : null;
                      },
                      itemCount: snapshot.data.cast.length,
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
