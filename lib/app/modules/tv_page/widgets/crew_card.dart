import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/shared/constants.dart';

class CrewCard extends StatelessWidget {
  const CrewCard({Key key, @required this.tv, @required this.index})
      : super(key: key);

  final TvDetails tv;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () =>
              Modular.to.pushNamed('/actorPage/${tv.createdBy[index].id}'),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderOnForeground: false,
            clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: tv.createdBy[index].profilePath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          '$IMAGE_BASE_URL${tv.createdBy[index].profilePath}',
                      fit: BoxFit.fitWidth,
                      width: 120,
                      height: 120,
                    )
                  : Image.asset(
                      tv.createdBy[index].gender == 2
                          ? 'assets/images/male_placeholder.jpg'
                          : 'assets/images/female_placeholder.jpg',
                      fit: BoxFit.cover,
                      height: 110,
                    ),
            ),
          ),
        ),
        tv.createdBy[index].name != null
            ? Text(
                '${tv.createdBy[index].name}',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 2,
                softWrap: true,
              )
            : Container()
      ],
    );
  }
}
