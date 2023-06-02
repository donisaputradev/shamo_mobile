import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authApiDataSource);

  final AuthApiDataSource authApiDataSource;

  @override
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authApiDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await authApiDataSource.logout();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> register({
    required String name,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final result = await authApiDataSource.register(
        name: name,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, User>> fetchUser() async {
    try {
      final result = await authApiDataSource.fetchUser();
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
