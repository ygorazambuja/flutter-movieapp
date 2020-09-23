import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class GenrePageAppBar extends StatelessWidget {
  final controller;

  const GenrePageAppBar({
    Key key,
    @required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      elevation: 10,
      expandedHeight: 150,
      titleSpacing: 10,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(controller.genreName,
            style: TextStyle(
                color: Colors.grey[200],
                fontSize: 16,
                fontFamily: GoogleFonts.poppins().fontFamily)),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      actions: [
        Observer(
          builder: (_) {
            return IconButton(
                icon: controller.appController.isDark
                    ? Icon(
                        EvaIcons.sun,
                        color: Colors.white,
                      )
                    : Icon(EvaIcons.moon, color: Colors.white),
                onPressed: () {
                  controller.appController.changeTheme();
                });
          },
        )
      ],
    );
  }
}
