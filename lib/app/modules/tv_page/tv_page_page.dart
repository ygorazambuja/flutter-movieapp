import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/tv_page/widgets/casting_list.dart';
import 'package:yshare/app/modules/tv_page/widgets/created_by_widget.dart';
import 'package:yshare/app/modules/tv_page/widgets/production_companies_horizontal_list.dart';
import 'package:yshare/app/modules/tv_page/widgets/seasons_horizontal_list.dart';
import 'package:yshare/app/modules/tv_page/widgets/title_widget.dart';
import 'package:yshare/app/modules/tv_page/widgets/tv_info_widget.dart';
import 'package:yshare/app/modules/tv_page/widgets/tv_overview_widget.dart';
import 'package:yshare/app/modules/tv_page/widgets/tv_page_appbar.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/domain/usecases/tv/get_tv_details_by_id_usecase.dart';

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
        body: FutureBuilder<TvDetails>(
      future: GetTvDetailsByIdUsecase(
          id: widget.id, repository: controller.repository)(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Column(
                children: [Text('No connection'), CircularProgressIndicator()],
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            var tv = snapshot.data;
            return CustomScrollView(
              slivers: [
                TvPageAppBar(controller: controller, tv: tv),
                TitleWidget(tv: tv),
                TvOverviewWidget(tv: tv),
                CreatedByWidget(tv: tv),
                ProductionCompaniesHorizontalList(
                    productionCompanies: tv.productionCompanies),
                SeasonHorizontalList(seasons: tv.seasons),
                TvInfoWidget(tv: tv),
                CastingList(
                  tv: tv,
                  controller: controller,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                  ),
                )
              ],
              physics: BouncingScrollPhysics(),
            );
            break;
          default:
            return Container();
            break;
        }
      },
    ));
  }
}
