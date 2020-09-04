import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'season_page_controller.dart';

class SeasonPagePage extends StatefulWidget {
  final String title;
  const SeasonPagePage({Key key, this.title = 'SeasonPage'}) : super(key: key);

  @override
  _SeasonPagePageState createState() => _SeasonPagePageState();
}

class _SeasonPagePageState
    extends ModularState<SeasonPagePage, SeasonPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
