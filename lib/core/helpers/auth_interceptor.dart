import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

/// Error handling when error in interceptor about authentication
class AuthHttpInterceptor extends InterceptorsWrapper {
  /// Repository to get data current token
  final AuthLocalDataSource authLocalDataSource;
  final VoidCallback? onUnAuth;

  ///
  AuthHttpInterceptor({required this.authLocalDataSource, this.onUnAuth});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await authLocalDataSource.getData();

    final optionHeaders = <String, Object>{};

    if (token != null) {
      optionHeaders.putIfAbsent(
          'Authorization', () => '${token.tokenType} ${token.accessToken}');
    }

    options.headers.addAll(optionHeaders);
    handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    final isError403 = (err.response?.statusCode == 403 &&
        err.requestOptions.headers['ignore_403'] != true);

    final isError401 = (err.response?.statusCode == 401 &&
        err.requestOptions.headers['ignore_401'] != true);

    if (isError401 || isError403) {
      GetIt.I<AuthBloc>()
        ..add(LogoutEvent())
        ..add(InitializeAuthEvent());
      onUnAuth?.call();
    }
    handler.next(err);
  }
}
