import 'package:admob_flutter/admob_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yshare/app/modules/tv_page/tv_page_controller.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/shared/constants.dart';

class TvPageAppBar extends StatefulWidget {
  final TvPageController controller;
  final TvDetails tv;

  const TvPageAppBar({
    Key key,
    @required this.controller,
    @required this.tv,
  }) : super(key: key);

  @override
  _TvPageAppBarState createState() => _TvPageAppBarState();
}

class _TvPageAppBarState extends State<TvPageAppBar> {
  AdmobInterstitial interstitial;

  @override
  void initState() {
    super.initState();
    interstitial = AdmobInterstitial(
      adUnitId: 'ca-app-pub-8572242041813835/5029175293',
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitial.load();
      },
    );
    interstitial.load();
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
            icon: widget.controller.appController.favouriteSeries
                    .contains(widget.tv.id)
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
              widget.controller.appController.addSerieInFavourite(widget.tv.id);

              widget.controller.appController.favouriteSeries
                      .contains(widget.tv.id)
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
                            child: Text(
                                '${widget.tv.originalName} added in favourites!'),
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
                            child: Text(
                                '${widget.tv.originalName} removed from favourites !'),
                          ),
                        ],
                      ),
                    );
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
              child: widget.tv.posterPath == null
                  ? Container()
                  : Image.network(
                      IMAGE_BASE_URL + widget.tv.posterPath,
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
