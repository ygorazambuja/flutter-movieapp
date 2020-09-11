import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/shared/constants.dart';

class CompactCastCard extends StatelessWidget {
  final ActorDetails actorDetails;

  const CompactCastCard({Key key, @required this.actorDetails})
      : super(key: key);
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
                '/actorPage/${actorDetails.id}',
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: actorDetails.profilePath != null
                  ? Image.network(
                      '$IMAGE_BASE_URL${actorDetails.profilePath}',
                      height: 150,
                    )
                  : Container(
                      height: 150,
                    ),
            ),
          ),
          Text(
            '${actorDetails.name}',
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
                '${actorDetails.popularity.toStringAsFixed(2)}',
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
