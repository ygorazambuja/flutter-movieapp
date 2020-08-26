import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldState;

  HomeAppBar(this._scaffoldState);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      elevation: 10,
      expandedHeight: 150,
      titleSpacing: 10,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('What would you like to watch today ?',
            style: TextStyle(
                color: Colors.grey[200],
                fontSize: 16,
                fontFamily: GoogleFonts.poppins().fontFamily)),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      leading: IconButton(
        icon: Icon(EvaIcons.menu2Outline),
        onPressed: () {
          widget._scaffoldState.currentState.openDrawer();
        },
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
