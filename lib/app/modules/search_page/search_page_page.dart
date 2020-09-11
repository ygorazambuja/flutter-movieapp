import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/search_page/widgets/compact_card_film.dart';
import 'package:yshare/app/modules/search_page/widgets/compact_cast_card.dart';
import 'package:yshare/app/modules/search_page/widgets/compact_tv_film.dart';
import 'package:yshare/app/modules/search_page/widgets/search_page_bar.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/entities/tv.dart';

import 'search_page_controller.dart';

class SearchPagePage extends StatefulWidget {
  final String title;
  final String name;

  const SearchPagePage({Key key, this.title = 'SearchPage', this.name})
      : super(key: key);

  @override
  _SearchPagePageState createState() => _SearchPagePageState();
}

class _SearchPagePageState
    extends ModularState<SearchPagePage, SearchPageController> {
  //use 'controller' variable to access controller

  final ScrollController _scrollController = ScrollController();

  AdmobBannerSize bannerSize;
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.setActualPage(controller.actualPage + 1);
      controller.fetchMultiSearch();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    bannerSize = AdmobBannerSize.BANNER;
    super.initState();
    controller.setSearchName(widget.name);
    controller.fetchMultiSearch();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SearchPageBar(controller: controller),
            SliverToBoxAdapter(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1,
                ),
                itemCount: controller.films.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (controller.films[index]['media_type'] == 'tv') {
                    return CompactTvFilm(
                      tv: Tv.fromJson(
                        controller.films[index],
                      ),
                    );
                  } else if (controller.films[index]['media_type'] == 'movie') {
                    return CompactCardFilm(
                      film: Film.fromJson(
                        controller.films[index],
                      ),
                    );
                  } else {
                    return CompactCastCard(
                        actorDetails:
                            ActorDetails.fromJson(controller.films[index]));
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20),
            ))
          ],
        ),
      ),
    );
  }
}
