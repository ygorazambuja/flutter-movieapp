import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/tv_details.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key key,
    @required this.tv,
  }) : super(key: key);

  final TvDetails tv;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${tv.originalName}',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.fade,
              textScaleFactor: 0.8,
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  tv.voteAverage.toStringAsFixed(1),
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  EvaIcons.star,
                  color: Colors.amber[800],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
