import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/widgets/person_favourite_card.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/usecases/actor_details/get_actor_details_usecase.dart';

import '../home_controller.dart';

class FavouriteActorList extends StatelessWidget {
  final Color color;
  final HomeController controller;

  const FavouriteActorList({
    Key key,
    @required this.color,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Observer(
          builder: (_) => controller.appController.subscribedActors.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Favourites Peoples',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 20)),
                    ),
                    Container(
                      height: controller.appController.subscribedActors.isEmpty
                          ? 0
                          : 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: color),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.appController.subscribedActors.length,
                          itemBuilder: (context, index) {
                            var id = controller
                                .appController.subscribedActors[index];
                            return FutureBuilder<ActorDetails>(
                                future: GetActorDetailsUsecase(
                                    actorId: id.toString(),
                                    repository:
                                        controller.actorDetailsRepository)(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data.profilePath == null) {
                                      return Container();
                                    } else {
                                      return PersonFavouriteCard(
                                          actorDetails: snapshot.data);
                                    }
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                });
                          }),
                    ),
                  ],
                )
              : Container()),
    );
  }
}
