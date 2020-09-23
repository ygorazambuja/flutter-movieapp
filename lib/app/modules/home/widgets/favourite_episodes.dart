import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/home_controller.dart';
import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/domain/usecases/episode/get_episode_details_usecase.dart';
import 'package:yshare/shared/constants.dart';

class FavouriteEpisodes extends StatelessWidget {
  final HomeController controller;

  const FavouriteEpisodes({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.appController.favouriteEpisodes);
    return SliverToBoxAdapter(
      child: Observer(
        builder: (context) => controller
                .appController.favouriteEpisodes.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Favourites Episodes',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20)),
                  ),
                  Container(
                    height: controller.appController.favouriteEpisodes.isEmpty
                        ? 0
                        : 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.blueAccent),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.appController.favouriteEpisodes.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder<Episode>(
                              future: GetEpisodeDetailsUsecase(
                                  favouriteEpisode: controller
                                      .appController.favouriteEpisodes[index],
                                  repository: controller.episodeRepository)(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.stillPath != null) {
                                    return Container(
                                      width: 140,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              controller
                                                  .appController
                                                  .favouriteEpisodes[index]
                                                  .showName,
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              'Episode ${snapshot.data.episodeNumber}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 18)),
                                          InkWell(
                                            onTap: () => Modular.to.pushNamed(
                                                '/tvPage/${controller.appController.favouriteEpisodes[index].showId}/season/${controller.appController.favouriteEpisodes[index].seasonId}',
                                                arguments: {
                                                  'showName': controller
                                                      .appController
                                                      .favouriteEpisodes[index]
                                                      .showName
                                                }),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              borderOnForeground: false,
                                              elevation: 10,
                                              clipBehavior: Clip.antiAlias,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$IMAGE_BASE_URL${snapshot.data.stillPath}',
                                                  fit: BoxFit.cover,
                                                  height: 150,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Season ${snapshot.data.seasonNumber}',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                } else {
                                  return CircularProgressIndicator();
                                }
                              });
                        }),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
