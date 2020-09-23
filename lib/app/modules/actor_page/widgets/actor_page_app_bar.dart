import 'package:admob_flutter/admob_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yshare/app/modules/actor_page/actor_page_controller.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/shared/constants.dart';

class ActorPageAppBar extends StatefulWidget {
  final ActorPageController controller;
  final dynamic id;
  final ActorDetails actorDetails;

  const ActorPageAppBar({
    Key key,
    @required this.controller,
    @required this.id,
    @required this.actorDetails,
  }) : super(key: key);

  @override
  _ActorPageAppBarState createState() => _ActorPageAppBarState();
}

class _ActorPageAppBarState extends State<ActorPageAppBar> {
  AdmobInterstitial interstitial;

  @override
  void initState() {
    super.initState();

    interstitial = AdmobInterstitial(
      adUnitId: ACTOR_INTERSTICIAL,
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
    widget.controller.appController.subscribedActors
            .contains(widget.actorDetails.id)
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
                      Text('${widget.actorDetails.name} added in favourites !'),
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
                      '${widget.actorDetails.name} removed from favourites !'),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      actions: [
        Observer(
          builder: (_) {
            return IconButton(
              icon: widget.controller.appController.subscribedActors
                      .contains(int.parse(widget.id))
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
                    .addActorInFavourites(int.parse(widget.id));
              },
            );
          },
        ),
        Observer(builder: (_) {
          return IconButton(
              icon: widget.controller.appController.isDark
                  ? Icon(EvaIcons.sun)
                  : Icon(EvaIcons.moon),
              onPressed: () => widget.controller.appController.changeTheme());
        })
      ],
      backgroundColor: Colors.transparent,
      iconTheme: IconTheme.of(context),
      expandedHeight: 400,
      pinned: true,
      brightness: ThemeData().brightness,
      flexibleSpace: Row(
        children: [
          Container(
            width: width * 0.2,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
              child: widget.actorDetails.profilePath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          IMAGE_BASE_URL + widget.actorDetails.profilePath,
                      fit: BoxFit.fitWidth,
                    )
                  : Container(),
            ),
            width: width * 0.8,
          )
        ],
      ),
    );
  }
}
