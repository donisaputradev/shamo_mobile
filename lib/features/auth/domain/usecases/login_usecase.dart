import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class LoginUseCase implements UseCaseFuture<Failure, bool, LoginParams> {
  LoginUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
