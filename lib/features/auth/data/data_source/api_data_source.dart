import 'package:dio/dio.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

abstract class AuthApiDataSource {
  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<bool> login({
    required String email,
    required String password,
  });

  Future<bool> logout();

  Future<UserModel> fetchUser();
}

class AuthApiDataSourceImpl implements AuthApiDataSource {
  AuthApiDataSourceImpl({required this.dio, required this.authLocalDataSource});

  final AuthLocalDataSource authLocalDataSource;
  final Dio dio;

  @override
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      final token = TokenModel.fromJson(response.data['data']);
      if (response.statusCode == 200) {
        authLocalDataSource.saveCache(token);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await dio.post('/register', data: {
        'email': email,
        'username': username,
        'phone_number': phoneNumber,
        'password': password,
      });
      final token = TokenModel.fromJson(response.data['data']);
      if (response.statusCode == 200) {
        authLocalDataSource.saveCache(token);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final response = await dio.post('/logout');
      if (response.statusCode == 200) {
        authLocalDataSource.clearCache();
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<UserModel> fetchUser() async {
    try {
      final response = await dio.get('/user');
      if (response.data is String) {
        throw const UnAuthenticationServerException(message: 'Unauthorization');
      } else {
        return UserModel.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
