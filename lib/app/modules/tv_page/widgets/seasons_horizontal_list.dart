import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/season.dart';
import 'package:yshare/shared/constants.dart';

class SeasonHorizontalList extends StatelessWidget {
  final List<Season> seasons;
  final String id;
  final String showName;

  const SeasonHorizontalList(
      {Key key,
      @required this.seasons,
      @required this.id,
      @required this.showName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Text('Seasons',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.only(top: 20),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100)),
                color: Colors.pink[400]),
            child: Container(
              height: 200,
              child: ListView.builder(
                  itemCount: seasons.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                        children: [
                          InkWell(
                            onTap: () => Modular.to.pushNamed(
                                '/tvPage/$id/season/${seasons[index].seasonNumber}',
                                arguments: {'showName': showName}),
                            child: Card(
                              color: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              borderOnForeground: false,
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: seasons[index].posterPath != null
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$IMAGE_BASE_URL${seasons[index].posterPath}',
                                        fit: BoxFit.fitWidth,
                                        width: 120,
                                        height: 120,
                                      )
                                    : Container(
                                        width: 120,
                                        height: 120,
                                        color: Colors.white12,
                                      ),
                              ),
                            ),
                          ),
                          seasons[index].name != null
                              ? Text(
                                  '${seasons[index].name}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: true,
                                )
                              : Container()
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
