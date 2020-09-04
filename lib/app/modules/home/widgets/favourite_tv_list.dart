import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/home_controller.dart';
import 'package:yshare/components/card_tv.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/domain/usecases/tv/get_tv_details_by_id_usecase.dart';

class FavouriteTvList extends StatelessWidget {
  final HomeController controller;
  final Color color;

  const FavouriteTvList({Key key, this.controller, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Observer(
            builder: (_) => controller.appController.favouriteSeries.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Favourites Tv shows',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20)),
                      ),
                      Container(
                        height: controller.appController.favouriteSeries.isEmpty
                            ? 0
                            : 250,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: color),
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.appController.favouriteSeries.length,
                            itemBuilder: (context, index) {
                              var id = controller
                                  .appController.favouriteSeries[index];
                              return FutureBuilder<TvDetails>(
                                  future: GetTvDetailsByIdUsecase(
                                      id: id.toString(),
                                      repository: controller.tvRepository)(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.posterPath == null) {
                                        return Container();
                                      } else {
                                        return CardTv(
                                          tv: snapshot.data,
                                        );
                                      }
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  });
                            }),
                      ),
                    ],
                  )
                : Container()));
  }
}
