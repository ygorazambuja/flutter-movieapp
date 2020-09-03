import 'package:dio/dio.dart';

class DioSingletonProvider {
  static Dio _connection;

  static Dio get getConnection {
    return _connection ??= Dio();
  }

  static void dispose() {
    _connection = null;
  }
}
