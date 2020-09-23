import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yshare/domain/entities/film.dart';

class FilmInfo extends StatelessWidget {
  const FilmInfo({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              film.title,
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(film.tagline,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    EvaIcons.star,
                    color: Colors.yellow[800],
                    size: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${film.voteAverage}/10',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    'IMDb',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12),
                  )
                ],
              ),
              film.runtime != 0 && film.runtime != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${Duration(minutes: film.runtime).inHours.toString()}hr ${Duration(minutes: film.runtime).inMinutes.remainder(60)} Minutes',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  : Container(),
              film.releaseDate.isNotEmpty
                  ? Text(
                      '${DateFormat(DateFormat.MONTH).format(DateTime.parse(film.releaseDate))}'
                      '${DateFormat(DateFormat.YEAR).format(DateTime.parse(film.releaseDate))}',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 12),
                    )
                  : Text('No release date',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily))
            ],
          ),
        ],
      ),
    );
  }
}
