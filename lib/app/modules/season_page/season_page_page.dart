import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/season_page/widgets/episode_list_widget.dart';
import 'package:yshare/app/modules/season_page/widgets/season_app_bar.dart';
import 'package:yshare/domain/entities/season_details.dart';
import 'package:yshare/domain/usecases/tv_seasons/get_season_details_usecase.dart';
import 'season_page_controller.dart';

class SeasonPagePage extends StatefulWidget {
  final String title;
  final String showId;
  final String seasonId;
  final String showName;

  const SeasonPagePage({
    Key key,
    this.title = 'SeasonPage',
    @required this.showId,
    @required this.seasonId,
    @required this.showName,
  }) : super(key: key);

  @override
  _SeasonPagePageState createState() => _SeasonPagePageState();
}

class _SeasonPagePageState
    extends ModularState<SeasonPagePage, SeasonPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SeasonDetails>(
        future: GetSeasonDetailsUsecase(
            showId: widget.showId,
            seasonId: widget.seasonId,
            repository: controller.repository)(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              return snapshot.data != null
                  ? CustomScrollView(
                      slivers: [
                        SeasonAppBar(
                          controller: controller,
                          seasonDetails: snapshot.data,
                        ),
                        EpisodeListWidget(
                            episodes: snapshot.data.episodes,
                            appController: controller.appController,
                            seasonId: widget.seasonId,
                            showId: widget.showId,
                            showName: widget.showName),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 200,
                          ),
                        )
                      ],
                      physics: BouncingScrollPhysics(),
                    )
                  : Center(child: Text('Insufficient Information'));
              break;
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
