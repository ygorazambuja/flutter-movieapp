import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/film_page/widgets/person_cast_card.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/entities/film_credit.dart';
import 'package:yshare/domain/repository/film_credit/film_credit_abstract_repository.dart';
import 'package:yshare/domain/usecases/film_credits/get_film_credits_usecase.dart';

class CastHorizontalList extends StatelessWidget {
  final FilmCreditAbstractRepository repository;

  const CastHorizontalList({
    Key key,
    @required this.film,
    @required this.repository,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmCredit>(
      future: GetFilmCreditsUsecase(
          filmId: film.id.toString(), repository: repository)(),
      builder: (context, snapshot) {
        var filmCredit = snapshot.data;
        if (snapshot.hasData) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 10, bottom: 12),
                  child: Text('Casting',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18)),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: filmCredit.cast.length,
                      itemBuilder: (context, index) {
                        var cast = filmCredit.cast[index];
                        if (cast.profilePath == '' ||
                            cast.profilePath == null) {
                          return Container();
                        } else {
                          return PersonCastCard(cast: cast);
                        }
                      }),
                ),
              ],
            ),
          );
        } else {
          return SliverToBoxAdapter(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
