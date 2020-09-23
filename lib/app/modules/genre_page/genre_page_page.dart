import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/genre_page/genre_page_app_bar.dart';
import 'package:yshare/app/modules/search_page/widgets/compact_card_film.dart';
import 'package:yshare/shared/constants.dart';

import 'genre_page_controller.dart';

class GenrePagePage extends StatefulWidget {
  final String title;
  final String id;

  const GenrePagePage({
    Key key,
    this.title = 'GenrePage',
    @required this.id,
  }) : super(key: key);

  @override
  _GenrePagePageState createState() => _GenrePagePageState();
}

class _GenrePagePageState
    extends ModularState<GenrePagePage, GenrePageController> {
  //use 'controller' variable to access controller
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.setActualPage(controller.actualPage + 1);
      controller.fetchFilmsByGenre();
    }
  }

  @override
  void initState() {
    var genreName = GENRES
        .firstWhere((element) => element['id'] == int.parse(widget.id))['name'];

    controller.setGenreName(genreName);
    controller.setGenreId(widget.id);

    controller.fetchFilmsByGenre();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            GenrePageAppBar(controller: controller),
            SliverToBoxAdapter(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.films.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    CompactCardFilm(film: controller.films[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
