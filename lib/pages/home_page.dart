import 'package:bshare/components/trending_film_grid.dart';
import 'package:bshare/components/app_drawer.dart';
import 'package:bshare/components/search_floating_button.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final _api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.black38,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Movie Database"),
            ),
          ),
          SliverToBoxAdapter(child: TrendingFilmGrid(api: _api))
        ],
      ),
      floatingActionButton: SearchFloatingButton(),
      drawer: AppDrawer(),
    );
  }
}
