import 'package:yshare/domain/entities/review.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

class GetTvReviewsByIdUsecase {
  final TvAbstractRepository repository;
  final String id;

  GetTvReviewsByIdUsecase({this.repository, this.id});

  Future<List<Review>> call() async {
    return await repository.getTvReviews(id);
  }
}
