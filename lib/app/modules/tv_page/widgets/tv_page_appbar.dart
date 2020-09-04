import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yshare/app/modules/tv_page/tv_page_controller.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/shared/constants.dart';

class TvPageAppBar extends StatelessWidget {
  final TvPageController controller;
  final TvDetails tv;

  const TvPageAppBar({
    Key key,
    @required this.controller,
    @required this.tv,
  }) : super(key: key);

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
            icon: controller.appController.favouriteSeries.contains(tv.id)
                ? Icon(
                    EvaIcons.star,
                    color: Colors.amber[800],
                  )
                : Icon(
                    EvaIcons.starOutline,
                    color: Colors.amber[800],
                  ),
            onPressed: () {
              controller.appController.addSerieInFavourite(tv.id);

              controller.appController.favouriteSeries.contains(tv.id)
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
                            child:
                                Text('${tv.originalName} added in favourites!'),
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
                                '${tv.originalName} removed from favourites !'),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
        IconButton(
          icon: controller.appController.isDark
              ? Icon(EvaIcons.sun)
              : Icon(
                  EvaIcons.moon,
                  color: Colors.black,
                ),
          onPressed: () {
            controller.appController.changeTheme();
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
              child: tv.posterPath == null
                  ? Container()
                  : Image.network(
                      IMAGE_BASE_URL + tv.posterPath,
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
