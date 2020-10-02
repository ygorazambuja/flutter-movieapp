import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/cast.dart';
import 'package:yshare/shared/constants.dart';

class PersonCastCard extends StatelessWidget {
  const PersonCastCard({
    Key key,
    @required this.cast,
  }) : super(key: key);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Modular.to.pushNamed(
              '/actorPage/${cast.id}',
            ),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                borderOnForeground: false,
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: cast.profilePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: '$IMAGE_BASE_URL${cast.profilePath}',
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: cast.gender == 0
                            ? Image.asset(
                                'assets/images/male_placeholder.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                              )
                            : Image.asset(
                                'assets/images/female_placeholder.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                              ))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              '${cast.name}',
              style: TextStyle(
                fontSize: 10,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: true,
            ),
          ),
          cast.character != null && cast.character.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    'as ${cast.character}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
