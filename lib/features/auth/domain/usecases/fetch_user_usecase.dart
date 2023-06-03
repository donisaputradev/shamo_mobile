import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class FetchUserUseCase implements UseCaseFuture<Failure, User, NoParams> {
  FetchUserUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.fetchUser();
  }
}
