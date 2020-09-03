import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';
import 'package:yshare/domain/usecases/actor_details/get_actor_details_usecase.dart';
import 'package:yshare/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFilmList extends StatelessWidget {
  final List<int> actors;
  final Color color;
  final ActorDetailsAbstractRepository repository;

  const CardFilmList(
      {Key key,
      @required this.actors,
      @required this.color,
      @required this.repository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: actors.length,
      itemBuilder: (context, index) {
        return FutureBuilder<ActorDetails>(
          future: GetActorDetailsUsecase(
              actorId: actors[index].toString(), repository: repository)(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return SliverToBoxAdapter(child: Container());
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return SliverToBoxAdapter(child: CircularProgressIndicator());
                break;
              case ConnectionState.done:
                return SliverToBoxAdapter(
                  child: Container(
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => Modular.to.pushNamed(
                            '/actorPage/${snapshot.data.id}',
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            borderOnForeground: false,
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '$IMAGE_BASE_URL${snapshot.data.profilePath}',
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            '${snapshot.data.name}',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                break;
              default:
                return SliverToBoxAdapter(child: Container());
            }
          },
        );
      },
    );
  }
}
