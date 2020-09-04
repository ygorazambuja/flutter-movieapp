import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/home_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/usecases/film/get_film_by_id_usecase.dart';

import '../../../../components/card_film.dart';

class FavouriteFilmList extends StatelessWidget {
  final HomeController controller;
  final Color color;

  const FavouriteFilmList({
    Key key,
    @required this.color,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Observer(
      builder: (_) {
        return controller.appController.favouriteFilms.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Favourites Films',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    height: controller.appController.favouriteFilms.isEmpty
                        ? 0
                        : 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: color),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.appController.favouriteFilms.length,
                      itemBuilder: (context, index) {
                        var id = controller.appController.favouriteFilms[index];
                        return FutureBuilder<Film>(
                            future: GetFilmByIdUsecase(
                                id: id.toString(),
                                repository: controller.filmRepository)(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.posterPath == null) {
                                  return Container();
                                } else {
                                  return CardFilm(film: snapshot.data);
                                }
                              } else {
                                return CircularProgressIndicator();
                              }
                            });
                      },
                    ),
                  ),
                ],
              )
            : Container();
      },
    ));
  }
}
