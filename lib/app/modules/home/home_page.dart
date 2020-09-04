import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/widgets/chips_lists.dart';
import 'package:yshare/app/modules/home/widgets/favourite_actor_list.dart';
import 'package:yshare/app/modules/home/widgets/favourite_film_list.dart';
import 'package:yshare/app/modules/home/widgets/favourite_tv_list.dart';
import 'package:yshare/app/modules/home/widgets/form_search_field.dart';
import 'package:yshare/app/modules/home/widgets/home_app_bar.dart';
import 'package:yshare/app/modules/home/widgets/popular_list.dart';
import 'package:yshare/app/modules/home/widgets/top_rated_list.dart';
import 'package:yshare/app/modules/home/widgets/trending_films_list.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key key,
    this.title = 'Home',
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  HomeAppBar(),
                  FormSearchField(),
                  TrendingFilmList(
                    repository: controller.filmRepository,
                    color: Colors.purple[300],
                  ),
                  FavouriteFilmList(
                    color: Colors.green[800],
                    controller: controller,
                  ),
                  FavouriteActorList(
                    controller: controller,
                    color: Colors.blue[400],
                  ),
                  FavouriteTvList(
                    controller: controller,
                    color: Colors.greenAccent,
                  ),
                  ChipList(),
                  PopularList(
                    controller: controller,
                    color: Colors.orange,
                  ),
                  TopRatedList(
                    controller: controller,
                    color: Colors.pink[400],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text(
                          'powered by: ',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: GoogleFonts.aBeeZee().fontFamily),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/the_movie_db.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                physics: BouncingScrollPhysics(),
              ),
            ],
          );
        },
      ),
      drawer: Drawer(),
    );
  }
}
