import 'package:flutter/foundation.dart';
import 'package:yshare/domain/entities/review.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';

class GetFilmReviewUsecase {
  final FilmAbstractRepository repository;
  final String id;
  final int page;

  GetFilmReviewUsecase(
      {@required this.repository, @required this.id, @required this.page});

  Future<List<Review>> call() async {
    return await repository.getFilmReview(id, page);
  }
}
