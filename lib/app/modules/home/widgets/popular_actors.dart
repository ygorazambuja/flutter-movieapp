import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';
import 'package:yshare/app/modules/home/widgets/person_favourite_card.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';
import 'package:yshare/domain/usecases/actor_details/get_popular_actors_usecase.dart';

class PopularActors extends StatelessWidget {
  final ActorDetailsAbstractRepository repository;

  const PopularActors({
    Key key,
    @required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActorDetails>>(
      future: GetPopularActorsUsecase(repository: repository, page: 1)(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return SliverToBoxAdapter(child: Container());
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case ConnectionState.done:
            return SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10, right: 20, bottom: 10),
                    child: Text('Popular Actors',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20)),
                  ),
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: RandomColor().randomColor().withOpacity(0.6),
                    ),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => PersonFavouriteCard(
                        actorDetails: snapshot.data[index],
                      ),
                    ),
                  ),
                ]));
            break;
          default:
            return SliverToBoxAdapter(child: Container());
            break;
        }
      },
    );
  }
}
