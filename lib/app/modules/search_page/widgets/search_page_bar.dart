import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/search_page/search_page_controller.dart';

class SearchPageBar extends StatelessWidget {
  final SearchPageController controller;

  const SearchPageBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      elevation: 10,
      expandedHeight: 150,
      titleSpacing: 10,
      floating: true,
      pinned: true,
      snap: false,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(controller.searchName,
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
                    ? Icon(EvaIcons.sun)
                    : Icon(EvaIcons.moon),
                onPressed: () {
                  controller.appController.changeTheme();
                });
          },
        )
      ],
    );
  }
}
