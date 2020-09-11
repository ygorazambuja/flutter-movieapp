import 'package:flutter/material.dart';
import 'package:yshare/app/modules/season_page/widgets/episode_info_widget.dart';
import 'package:yshare/domain/entities/episode.dart';

class EpisodeListWidget extends StatelessWidget {
  final List<Episode> episodes;

  const EpisodeListWidget({Key key, @required this.episodes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: episodes != null && episodes.isNotEmpty
            ? ListView.builder(
                itemCount: episodes.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    EpisodeInfoWidget(episode: episodes[index]),
              )
            : Center(
                child: Text('No Episodes Information'),
              ),
      ),
    );
  }
}
