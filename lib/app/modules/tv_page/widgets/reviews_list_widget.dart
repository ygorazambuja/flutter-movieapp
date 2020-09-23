import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/review.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';
import 'package:yshare/domain/usecases/tv/get_tv_reviews_by_id_usecase.dart';

class ReviewsListWidget extends StatelessWidget {
  final String id;
  final TvAbstractRepository repository;

  const ReviewsListWidget(
      {Key key, @required this.id, @required this.repository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<Review>>(
        future: GetTvReviewsByIdUsecase(
          id: id,
          repository: repository,
        )(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemExtent: MediaQuery.of(context).size.width / 2,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final review = snapshot.data[index];
                          return Card(
                            margin: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      review.author,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(review.content),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
              break;
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
