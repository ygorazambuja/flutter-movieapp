import 'package:flutter/material.dart';
import 'package:yshare/app/modules/season_page/widgets/episode_info_widget.dart';
import 'package:yshare/domain/entities/episode.dart';

import '../../../app_controller.dart';

class EpisodeListWidget extends StatelessWidget {
  final List<Episode> episodes;
  final AppController appController;
  final String seasonId;
  final String showId;
  final String showName;

  const EpisodeListWidget({
    Key key,
    @required this.episodes,
    @required this.appController,
    this.seasonId,
    this.showId,
    this.showName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: episodes != null && episodes.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: episodes.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => EpisodeInfoWidget(
                episode: episodes[index],
                appController: appController,
                seasonId: seasonId,
                showId: showId,
                showName: showName,
              ),
            )
          : Center(
              child: Text('No Episodes Information'),
            ),
    );
  }
}
