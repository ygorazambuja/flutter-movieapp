import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';
import 'package:yshare/shared/constants.dart';
import 'drawer_page_controller.dart';

class DrawerPagePage extends StatefulWidget {
  final String title;
  const DrawerPagePage({Key key, this.title = 'DrawerPage'}) : super(key: key);

  @override
  _DrawerPagePageState createState() => _DrawerPagePageState();
}

class _DrawerPagePageState
    extends ModularState<DrawerPagePage, DrawerPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            floating: true,
            leading: IconButton(
              icon: Icon(EvaIcons.arrowBack),
              onPressed: () => Modular.to.pop(),
            ),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/yshare-logo.png'),
                      fit: BoxFit.fitWidth)),
            ),
            shadowColor: Colors.black12,
          ),
          SliverToBoxAdapter(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1, maxCrossAxisExtent: 200),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: GENRES.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    Modular.to.pushNamed('/genrePage/${GENRES[index]['id']}'),
                child: Container(
                  decoration: BoxDecoration(
                      color: RandomColor().randomColor().withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      GENRES[index]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
