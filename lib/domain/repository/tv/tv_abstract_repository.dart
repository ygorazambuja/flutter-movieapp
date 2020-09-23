import 'package:yshare/domain/entities/cast.dart';
import 'package:yshare/domain/entities/review.dart';
import 'package:yshare/domain/entities/tv_details.dart';

abstract class TvAbstractRepository {
  Future<TvDetails> getTvDetailsById(String id);
  Future<List<Cast>> getTvCasting(String id);
  Future<List<Review>> getTvReviews(String id);
}
