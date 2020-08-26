import 'package:bshare/provider/api.dart';
import 'package:bshare/provider/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Api().getFilmByGenre(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var genreName = GENRES.firstWhere(
                (element) => element['id'] == int.parse(widget.id))['name'];
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(genreName),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
