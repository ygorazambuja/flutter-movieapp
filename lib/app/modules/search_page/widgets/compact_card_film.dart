import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/shared/constants.dart';

class CompactCardFilm extends StatelessWidget {
  const CompactCardFilm({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Modular.to.pushNamed(
                '/filmPage/${film.id}',
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: film.posterPath != null
                  ? Image.network(
                      '$IMAGE_BASE_URL${film.posterPath}',
                      height: 150,
                    )
                  : Container(
                      height: 150,
                    ),
            ),
          ),
          Text(
            '${film.title}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                EvaIcons.star,
                color: Colors.yellow.shade800,
                size: 14,
              ),
              Text(
                '${film.voteAverage.toStringAsFixed(2)}/10',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
