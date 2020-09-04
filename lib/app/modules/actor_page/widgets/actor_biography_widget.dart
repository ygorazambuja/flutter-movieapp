import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/actor_details.dart';

class ActorBiographyWidget extends StatelessWidget {
  final ActorDetails actorDetails;

  const ActorBiographyWidget({Key key, this.actorDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ExpansionTile(
        initiallyExpanded: false,
        childrenPadding: const EdgeInsets.all(10),
        title: Text('Biography'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Text(actorDetails.biography,
                style:
                    TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
          )
        ],
      ),
    );
  }
}
