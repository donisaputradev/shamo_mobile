import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class RegisterUseCase implements UseCaseFuture<Failure, bool, RegisterParams> {
  RegisterUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(RegisterParams params) async {
    return await authRepository.register(
      email: params.email,
      password: params.password,
      name: params.name,
      phoneNumber: params.phoneNumber,
      username: params.username,
    );
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.username,
  });

  final String email;
  final String password;
  final String name;
  final String username;
  final String phoneNumber;

  @override
  List<Object?> get props => [email, password, name, username, phoneNumber];
}
