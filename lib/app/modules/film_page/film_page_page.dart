import 'package:bshare/components/film_info.dart';
import 'package:bshare/components/genres_chip_list.dart';
import 'package:bshare/components/person_card.dart';
import 'package:bshare/model/cast.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/model/film_credit.dart';
import 'package:bshare/provider/api.dart';
import 'package:bshare/provider/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'film_page_controller.dart';

class FilmPagePage extends StatefulWidget {
  final String title;
  final String id;
  const FilmPagePage({
    Key key,
    @required this.id,
    this.title = 'FilmPage',
  }) : super(key: key);

  @override
  _FilmPagePageState createState() => _FilmPagePageState();
}

class _FilmPagePageState
    extends ModularState<FilmPagePage, FilmPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Film>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final film = snapshot.data;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  CircleAvatar(
                    backgroundColor: Colors.white38,
                  )
                ],
                backgroundColor: Colors.white10,
                expandedHeight: MediaQuery.of(context).size.height / 1.3,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('$IMAGE_BASE_URL${film.posterPath}'),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                    ),
                  ),
                )),
              ),
              FilmInfo(film: film),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(film.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              )),
              GenresChipList(film: film),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Casting',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              )),
              FutureBuilder<FilmCredit>(
                future: Api().getFilmCredits(film.id),
                builder: (context, snapshot) {
                  var filmCredit = snapshot.data;
                  print(filmCredit);
                  if (snapshot.hasData) {
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 140,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filmCredit.cast.length,
                            itemBuilder: (context, index) {
                              var cast = filmCredit.cast[index];
                              if (cast.profilePath == '' ||
                                  cast.profilePath == null) {
                                return Container();
                              } else {
                                return PersonCard(cast: cast);
                              }
                            }),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 700,
                  color: Colors.pink,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: Api().getFilmById(int.parse(widget.id)),
    ));
  }
}
