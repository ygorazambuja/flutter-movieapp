import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/tv_details.dart';

class TvOverviewWidget extends StatelessWidget {
  final TvDetails tv;

  const TvOverviewWidget({Key key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          tv.overview,
          textAlign: TextAlign.justify,
          style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        ),
      ),
    );
  }
}
