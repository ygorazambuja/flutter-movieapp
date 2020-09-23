import 'package:admob_flutter/admob_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yshare/app/modules/film_page/film_page_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/shared/constants.dart';

class FilmPageAppBar extends StatefulWidget {
  final FilmPageController controller;
  final Film film;

  FilmPageAppBar({
    @required this.controller,
    @required this.film,
  });

  @override
  _FilmPageAppBarState createState() => _FilmPageAppBarState();
}

class _FilmPageAppBarState extends State<FilmPageAppBar> {
  AdmobInterstitial interstitial;

  @override
  void initState() {
    super.initState();
    interstitial = AdmobInterstitial(
      adUnitId: FILM_INTERSTICIAL,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) {
          interstitial.load();
          showNotification();
        }
      },
    );
    interstitial.load();
  }

  void showNotification() {
    widget.controller.appController.favouriteFilms.contains(widget.film.id)
        ? BotToast.showNotification(
            title: (cancelFunc) => Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    EvaIcons.heart,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.film.title} added in favourites !'),
                ),
              ],
            ),
          )
        : BotToast.showNotification(
            title: (cancelFunc) => Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    EvaIcons.heartOutline,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.film.title} removed from favourites !'),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconTheme.of(context),
      expandedHeight: 400,
      pinned: true,
      brightness: ThemeData().brightness,
      actions: [
        Observer(
          builder: (context) => IconButton(
            icon: widget.controller.appController.favouriteFilms
                    .contains(widget.film.id)
                ? Icon(
                    EvaIcons.star,
                    color: Colors.amber[800],
                  )
                : Icon(
                    EvaIcons.starOutline,
                    color: Colors.amber[800],
                  ),
            onPressed: () {
              interstitial.show();
              widget.controller.appController
                  .addFilmIntoFavourites(widget.film.id);

              showNotification();
            },
          ),
        ),
        IconButton(
          icon: widget.controller.appController.isDark
              ? Icon(EvaIcons.sun)
              : Icon(
                  EvaIcons.moon,
                  color: Colors.black,
                ),
          onPressed: () {
            widget.controller.appController.changeTheme();
          },
        )
      ],
      flexibleSpace: Row(
        children: [
          Container(
            width: width * 0.2,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
              child: widget.film.posterPath == null
                  ? Container()
                  : CachedNetworkImage(
                      imageUrl: IMAGE_BASE_URL + widget.film.posterPath,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            width: width * 0.8,
          ),
        ],
      ),
    );
  }
}
