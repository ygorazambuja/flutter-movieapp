import 'package:yshare/app/modules/actor_page/actor_page_controller.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/entities/actor_participation.dart';
import 'package:yshare/domain/usecases/actor_participation/get_actor_participation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ActorInfoWidget extends StatelessWidget {
  final ActorDetails actorDetails;
  final ActorPageController controller;

  const ActorInfoWidget(
      {Key key, @required this.actorDetails, @required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            actorDetails.name,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'participations',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  FutureBuilder<ActorParticipation>(
                      future: GetActorParticipationUsecase(
                          actorId: actorDetails.id.toString(),
                          repository:
                              controller.actorParticipationRepository)(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Container();
                            break;
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                            break;
                          case ConnectionState.done:
                            if (snapshot.data is ActorParticipation) {
                              return Text(
                                snapshot.data.cast.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                              );
                            } else {
                              return Container();
                            }
                            break;
                          default:
                            return Container();
                        }
                      })
                ],
              ),
              actorDetails.birthday != null
                  ? Column(children: [
                      Text(
                        'birthday',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      Text(
                        DateFormat(DateFormat.ABBR_MONTH_DAY)
                            .format(DateTime.parse(actorDetails.birthday)),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      )
                    ])
                  : Container(),
              Column(
                children: [
                  Text(
                    'popularity',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  Text(
                    actorDetails.popularity.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
