import 'package:yshare/app/modules/film_page/widgets/person_crew_card.dart';
import 'package:yshare/domain/entities/film_credit.dart';
import 'package:yshare/domain/repository/film_credit/film_credit_abstract_repository.dart';
import 'package:yshare/domain/usecases/film_credits/get_film_credits_usecase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmPageCrewList extends StatelessWidget {
  final FilmCreditAbstractRepository repository;
  final String id;
  const FilmPageCrewList({
    Key key,
    @required this.id,
    @required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<FilmCredit>(
          future: GetFilmCreditsUsecase(
            filmId: id,
            repository: repository,
          )(),
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
                if (snapshot.data is FilmCredit) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 10, bottom: 12),
                        child: Text('Crew',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18)),
                      ),
                      Container(
                        height: 170,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.crew.length,
                          itemBuilder: (context, index) {
                            return PersonCrewCard(
                              crew: snapshot.data.crew[index],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
                break;
              default:
                return Container();
            }
          }),
    );
  }
}
