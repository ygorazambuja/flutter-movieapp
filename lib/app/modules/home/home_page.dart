import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_color/random_color.dart';
import 'package:yshare/app/modules/home/widgets/chips_lists.dart';
import 'package:yshare/app/modules/home/widgets/favourite_actor_list.dart';
import 'package:yshare/app/modules/home/widgets/favourite_film_list.dart';
import 'package:yshare/app/modules/home/widgets/favourite_tv_list.dart';
import 'package:yshare/app/modules/home/widgets/form_search_field.dart';
import 'package:yshare/app/modules/home/widgets/home_app_bar.dart';
import 'package:yshare/app/modules/home/widgets/popular_list.dart';
import 'package:yshare/app/modules/home/widgets/top_rated_list.dart';
import 'package:yshare/app/modules/home/widgets/trending_films_list.dart';
import 'package:yshare/components/footer_widget.dart';
import 'package:yshare/components/main_drawer.dart';
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
  RandomColor color = RandomColor();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  HomeAppBar(scaffoldState: _scaffoldState),
                  FormSearchField(),
                  TrendingFilmList(
                    repository: controller.filmRepository,
                    color: color.randomColor().withOpacity(0.6),
                  ),
                  SliverToBoxAdapter(
                    child: AdmobBanner(
                      adUnitId: 'ca-app-pub-8572242041813835/2364549169',
                      adSize: AdmobBannerSize.BANNER,
                      listener:
                          (AdmobAdEvent event, Map<String, dynamic> args) {
                        print(event);
                      },
                    ),
                  ),
                  FavouriteFilmList(
                    color: color.randomColor().withOpacity(0.6),
                    controller: controller,
                  ),
                  FavouriteActorList(
                    controller: controller,
                    color: color.randomColor().withOpacity(0.6),
                  ),
                  FavouriteTvList(
                    controller: controller,
                    color: color.randomColor().withOpacity(0.6),
                  ),
                  ChipList(),
                  PopularList(
                    controller: controller,
                    color: color.randomColor().withOpacity(0.6),
                  ),
                  SliverToBoxAdapter(
                    child: AdmobBanner(
                      adUnitId: 'ca-app-pub-8572242041813835/7511868408',
                      adSize: AdmobBannerSize.BANNER,
                      listener:
                          (AdmobAdEvent event, Map<String, dynamic> args) {
                        print(event);
                      },
                    ),
                  ),
                  TopRatedList(
                    controller: controller,
                    color: color.randomColor().withOpacity(0.6),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                  FooterWidget(),
                  SliverToBoxAdapter(
                    child: AdmobBanner(
                      adUnitId: 'ca-app-pub-8572242041813835/2259541727',
                      adSize: AdmobBannerSize.BANNER,
                      listener:
                          (AdmobAdEvent event, Map<String, dynamic> args) {
                        print(event);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 200),
                    ),
                  ),
                ],
                physics: BouncingScrollPhysics(),
              ),
            ],
          );
        },
      ),
    );
  }
}
