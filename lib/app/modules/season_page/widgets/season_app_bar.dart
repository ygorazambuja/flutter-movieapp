import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yshare/app/modules/season_page/season_page_controller.dart';
import 'package:yshare/domain/entities/season_details.dart';
import 'package:yshare/shared/constants.dart';

class SeasonAppBar extends StatelessWidget {
  final SeasonPageController controller;
  final SeasonDetails seasonDetails;

  const SeasonAppBar({Key key, @required this.controller, this.seasonDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(0),
      iconTheme: IconTheme.of(context),
      pinned: true,
      elevation: 10,
      brightness: ThemeData().brightness,
      flexibleSpace: Row(
        children: [
          Container(
            width: width * 0.2,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
              child: seasonDetails.posterPath == null
                  ? Container()
                  : Image.network(
                      IMAGE_BASE_URL + seasonDetails.posterPath,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            width: width * 0.8,
          ),
        ],
      ),
      actions: [
        Observer(
          builder: (_) {
            return IconButton(
              icon: controller.appController.isDark
                  ? Icon(EvaIcons.sun)
                  : Icon(
                      EvaIcons.moon,
                      color: Colors.black,
                    ),
              onPressed: () {
                controller.appController.changeTheme();
              },
            );
          },
        )
      ],
    );
  }
}
