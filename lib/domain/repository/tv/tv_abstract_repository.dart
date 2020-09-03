import 'package:yshare/domain/entities/tv.dart';

abstract class TvAbstractRepository {
  Future<Tv> getTvDetailsById(String id);
}
