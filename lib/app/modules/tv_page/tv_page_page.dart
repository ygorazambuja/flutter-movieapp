import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/tv_page/widgets/tv_page_appbar.dart';
import 'tv_page_controller.dart';

class TvPagePage extends StatefulWidget {
  final String title;
  final String id;
  const TvPagePage({
    Key key,
    this.title = 'TvPage',
    @required this.id,
  }) : super(key: key);

  @override
  _TvPagePageState createState() => _TvPagePageState();
}

class _TvPagePageState extends ModularState<TvPagePage, TvPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [],
      ),
    );
  }
}
