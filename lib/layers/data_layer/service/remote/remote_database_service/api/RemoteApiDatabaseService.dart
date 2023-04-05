import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base/BaseRemoteDatabaseService.dart';
import '../enum/RemoteDatabaseServiceExceptionsEnum.dart';

@lazySingleton
class RemoteApiDatabaseService  extends BaseRemoteDatabaseService {
  final _dio = Dio();

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      throw RemoteDatabaseServiceExceptionsEnum.fromDioErrorType(e.type);
    } catch (e) {
      rethrow;
    }
  }
}


