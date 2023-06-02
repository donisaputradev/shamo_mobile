import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> register({
    required String name,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, User>> fetchUser();
}
