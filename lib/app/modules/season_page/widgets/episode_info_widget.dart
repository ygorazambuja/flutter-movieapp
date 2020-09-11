import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yshare/app/modules/film_page/widgets/person_cast_card.dart';
import 'package:yshare/domain/entities/episode.dart';
import 'package:yshare/shared/constants.dart';

class EpisodeInfoWidget extends StatelessWidget {
  final Episode episode;

  const EpisodeInfoWidget({Key key, @required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        episode.stillPath != null
            ? Image.network(
                '$IMAGE_BASE_URL${episode.stillPath}',
                fit: BoxFit.fitWidth,
                height: 240,
              )
            : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(episode.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(episode.voteAverage.toStringAsFixed(2)),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(EvaIcons.star, color: Colors.amber[700]),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(episode.overview),
        ),
        episode.guestStars.isNotEmpty
            ? Column(
                children: [
                  episode.airDate != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'on air: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                                .format(DateTime.parse(episode.airDate))),
                          ],
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Guests Stars',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 180,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: episode.guestStars.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => PersonCastCard(
                        cast: episode.guestStars[index],
                      ),
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
