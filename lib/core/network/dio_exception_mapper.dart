import 'package:dio/dio.dart';
import 'package:example_project/domain/models/failure.dart';

/// Logic for converting Dio errors into domain failures
mixin DioExceptionMapper {
  Failure mapDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final message = exception.message ?? 'Request failed';

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return Failure(
          message: message,
          type: FailureType.network,
          statusCode: statusCode,
        );
      case DioExceptionType.badResponse:
        return Failure(
          message: message,
          type: FailureType.server,
          statusCode: statusCode,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return Failure(
          message: message,
          type: FailureType.unexpected,
          statusCode: statusCode,
        );
    }
  }
}
