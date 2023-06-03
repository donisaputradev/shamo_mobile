import 'package:dio/dio.dart';
import 'package:shamo_mobile/core/core.dart';

extension DioErrorExtension on DioError {
  ServerException toServerException() {
    final data =
        response?.data is String ? null : Meta.fromJson(response?.data['meta']);
    switch (type) {
      case DioErrorType.badResponse:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: data?.message ?? 'Unauthorized',
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: data?.message ?? 'Forbidden',
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: data?.message ?? 'Not found',
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: data?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: data?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
        }

      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutServerException(
          message: data?.message ?? 'Connection timeout',
          code: response?.statusCode,
        );

      case DioErrorType.cancel:
      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        return GeneralServerException(
          message: data?.message ?? 'A Server Error Occurred',
          code: response?.statusCode,
        );
    }
  }
}
