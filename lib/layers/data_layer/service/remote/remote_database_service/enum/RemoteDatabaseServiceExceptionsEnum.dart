import 'package:dio/dio.dart';

import '../../../../../domain_layer/exception/enum/ExceptionsEnum.dart';

enum RemoteDatabaseServiceExceptionsEnum implements ExceptionsEnum {
  CONNECTION_TIMEOUT,
  SEND_TIMEOUT,
  RECEIVE_TIMEOUT,
  BAD_CERTIFICATE,
  BAD_RESPONSE,
  CONNECTION_ERROR,
  CANCEL,
  UNKNOWN,
  
  ;

  static RemoteDatabaseServiceExceptionsEnum fromDioErrorType(DioErrorType type) {
    switch (type) {
      case DioErrorType.connectionTimeout:
        return CONNECTION_TIMEOUT;
      case DioErrorType.sendTimeout:
        return SEND_TIMEOUT;
      case DioErrorType.receiveTimeout:
        return RECEIVE_TIMEOUT;
      case DioErrorType.cancel:
        return CANCEL;
      case DioErrorType.badCertificate:
        return BAD_CERTIFICATE;
      case DioErrorType.badResponse:
        return BAD_RESPONSE;
      case DioErrorType.connectionError:
        return CONNECTION_ERROR;
      case DioErrorType.unknown:
        return UNKNOWN;
    }
  }

  @override
  Enum get code => this;

  @override
  String get message => this.toString();
}
