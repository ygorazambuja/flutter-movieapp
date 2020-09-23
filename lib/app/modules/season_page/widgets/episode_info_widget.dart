import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yshare/app/modules/film_page/widgets/person_cast_card.dart';
import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/domain/entities/favourite_episode.dart';
import 'package:yshare/shared/constants.dart';

import '../../../app_controller.dart';

class EpisodeInfoWidget extends StatelessWidget {
  final Episode episode;
  final AppController appController;
  final String showId;
  final String seasonId;
  final String showName;
  const EpisodeInfoWidget({
    Key key,
    @required this.episode,
    @required this.appController,
    @required this.showId,
    @required this.seasonId,
    @required this.showName,
  }) : super(key: key);

  void showNotification(FavouriteEpisode favouriteEpisode) {
    appController.favouriteEpisodes.contains(favouriteEpisode)
        ? BotToast.showNotification(
            title: (cancelFunc) => Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    EvaIcons.heart,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${episode.name} added on Favourites',
                    style:
                        TextStyle(fontFamily: GoogleFonts.aBeeZee().fontFamily),
                  ),
                ),
              ],
            ),
          )
        : BotToast.showNotification(
            title: (cancelFunc) => Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        EvaIcons.heartOutline,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${episode.name} removed from Favourites',
                        style: TextStyle(
                            fontFamily: GoogleFonts.aBeeZee().fontFamily),
                      ),
                    ),
                  ],
                ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      elevation: 10,
      child: Column(
        children: [
          if (episode.stillPath != null)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: '$IMAGE_BASE_URL${episode.stillPath}',
                    fit: BoxFit.fitHeight,
                    height: 240,
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 8,
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      child: IconButton(onPressed: () {
                        final favouriteEpisode = FavouriteEpisode(
                            showName: showName,
                            episodeId: episode.id,
                            episodeNumber: episode.episodeNumber,
                            seasonId: int.parse(seasonId),
                            showId: int.parse(showId));

                        appController
                            .addEpisodeIntoFavourites(favouriteEpisode);

                        showNotification(favouriteEpisode);
                      }, icon: Observer(builder: (_) {
                        final favouriteEpisode = FavouriteEpisode(
                            showName: showName,
                            episodeId: episode.id,
                            episodeNumber: episode.episodeNumber,
                            seasonId: int.parse(seasonId),
                            showId: int.parse(showId));
                        return appController.favouriteEpisodes
                                .contains(favouriteEpisode)
                            ? Icon(
                                EvaIcons.star,
                                color: Colors.amber[700],
                              )
                            : Icon(
                                EvaIcons.starOutline,
                                color: Colors.amber[700],
                              );
                      })),
                    )),
              ],
            )
          else
            Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: Text(episode.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(episode.voteAverage.toStringAsFixed(2)),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(EvaIcons.star, color: Colors.amber[700]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(episode.overview),
          ),
          episode.guestStars.isNotEmpty
              ? Column(
                  children: [
                    episode.airDate != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'on air: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                                  .format(DateTime.parse(episode.airDate))),
                            ],
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Guests Stars',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: episode.guestStars.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => PersonCastCard(
                          cast: episode.guestStars[index],
                        ),
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
