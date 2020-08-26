import 'package:bshare/components/film_horizontal_list.dart';
import 'package:bshare/components/home_app_bar.dart';
import 'package:bshare/model/film.dart';
import 'package:bshare/provider/api.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final _scaffoldState = GlobalKey<ScaffoldState>();

  Future<List<Film>> requestFilms;
  @override
  void initState() {
    requestFilms = Api().getTrendingFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: Drawer(),
      body: FutureBuilder<List<Film>>(
          future: requestFilms,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var films = snapshot.data;
              return CustomScrollView(
                slivers: [
                  HomeAppBar(_scaffoldState),
                  SliverToBoxAdapter(
                      child: Container(
                    color: Colors.pink,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(),
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Search movies / tv series',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: Icon(EvaIcons.search)),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20, bottom: 10),
                          child: Text(
                            'Trending',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.pink.withOpacity(0.5),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10, right: 20, bottom: 10),
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilmHorizontalList(films: films),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20, bottom: 10),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.pink.withOpacity(0.5),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10, right: 20, bottom: 10),
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<Film>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return FilmHorizontalList(films: snapshot.data);
                      } else {
                        return SliverToBoxAdapter();
                      }
                    },
                    future: Api().getPopular(),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20, bottom: 10),
                          child: Text(
                            'Top Rated',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.pink.withOpacity(0.5),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10, right: 20, bottom: 10),
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<Film>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return FilmHorizontalList(films: snapshot.data);
                      } else {
                        return SliverToBoxAdapter();
                      }
                    },
                    future: Api().getTopRated(),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
