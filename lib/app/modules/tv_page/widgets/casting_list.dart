import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/tv_page/tv_page_controller.dart';
import 'package:yshare/domain/entities/cast.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/domain/usecases/tv/get_tv_cast_by_id_usecase.dart';
import 'package:yshare/shared/constants.dart';

class CastingList extends StatelessWidget {
  final TvDetails tv;
  final TvPageController controller;

  const CastingList({Key key, this.tv, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<Cast>>(
        future: GetTvCastByIdUsecase(
            id: tv.id.toString(), repository: controller.repository)(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.done:
              var casts = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Cast',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(top: 20),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100)),
                        color: Colors.green[300]),
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CastCard(
                                cast: casts[index],
                              )),
                    ),
                  ),
                ],
              );
              break;
            default:
              return SliverToBoxAdapter(
                child: Container(),
              );
              break;
          }
        },
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({Key key, @required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Modular.to.pushNamed('/actorPage/${cast.id}'),
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderOnForeground: false,
            clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: cast.profilePath != null
                  ? Image.network(
                      '$IMAGE_BASE_URL${cast.profilePath}',
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
        cast.name != null
            ? Text(
                '${cast.name}',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 2,
                softWrap: true,
              )
            : Container(),
      ],
    );
  }
}
