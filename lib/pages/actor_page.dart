import 'package:bshare/components/actor_movies_participation_grid.dart';
import 'package:bshare/components/film_card.dart';
import 'package:bshare/model/actor_details.dart';
import 'package:bshare/model/actor_participation.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ActorPage extends StatelessWidget {
  final ActorDetails actorDetails;
  final _api = Api();
  ActorPage(this.actorDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black26,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(actorDetails.name),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Image.network(
                    actorDetails.profilePath,
                    width: 150,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    actorDetails.biography,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          ActorMoviesParticipationGrid(api: _api, actorDetails: actorDetails),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Text('Crew Participations',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                FutureBuilder<ActorParticipation>(
                  future: _api.getActorParticipation(actorDetails.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            padding: EdgeInsets.all(10.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 2.0,
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.6),
                            itemBuilder: (context, index) {
                              return snapshot.data.crew[index].posterPath !=
                                      null
                                  ? FilmCard(context, snapshot.data.crew[index])
                                  : null;
                            },
                            itemCount: snapshot.data.crew.length,
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
          )
        ],
      ),
    );
  }
}
