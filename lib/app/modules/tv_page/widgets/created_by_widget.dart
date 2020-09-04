import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/tv_page/widgets/crew_card.dart';
import 'package:yshare/domain/entities/tv_details.dart';

class CreatedByWidget extends StatelessWidget {
  final TvDetails tv;

  const CreatedByWidget({Key key, @required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Text('Created By',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          Container(
            padding: const EdgeInsets.only(right: 12, top: 20),
            margin: const EdgeInsets.only(left: 10),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100)),
                color: Colors.yellow[900]),
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: tv.createdBy.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CrewCard(tv: tv, index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
