import 'package:dio/dio.dart';

abstract class BaseRemoteDatabaseService {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
