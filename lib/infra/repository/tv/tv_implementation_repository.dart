import 'package:yshare/api_key.dart';
import 'package:yshare/domain/entities/cast.dart';
import 'package:yshare/domain/entities/review.dart';
import 'package:yshare/domain/entities/tv_details.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';
import 'package:yshare/infra/dio_singleton_provider.dart';

class TvImplementationRepository extends TvAbstractRepository {
  final connection = DioSingletonProvider.getConnection;

  @override
  Future<TvDetails> getTvDetailsById(String id) async {
    final _endpoint =
        'https://api.themoviedb.org/3/tv/$id$API_KEY&language=en-US';
    final response = await connection.get(_endpoint);
    return TvDetails.fromJson(response.data);
  }

  @override
  Future<List<Cast>> getTvCasting(String id) async {
    final _endpoint =
        'https://api.themoviedb.org/3/tv/$id/credits$API_KEY&language=en-US';
    var casts = <Cast>[];
    final response = await connection.get(_endpoint);

    for (var json in response.data['cast']) {
      casts.add(Cast.fromJson(json));
    }

    return casts;
  }

  @override
  Future<List<Review>> getTvReviews(String id) async {
    final _endpoint =
        'https://api.themoviedb.org/3/tv/$id/reviews$API_KEY&language=en-US&page=1';
    final response = await connection.get(_endpoint);
    var reviews = <Review>[];

    for (var json in response.data['results']) {
      reviews.add(Review.fromJson(json));
    }
    return reviews;
  }
}
