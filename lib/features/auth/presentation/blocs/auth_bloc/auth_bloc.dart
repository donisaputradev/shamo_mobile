import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/domain/usecases/fetch_user_usecase.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.fetchUserUseCase,
  }) : super(AuthState.initial()) {
    /// CHECK AUTHENTICATION EVENT
    on<CheckAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await fetchUserUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: AuthStateStatus.unauthenticated,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(status: AuthStateStatus.authenticated));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final FetchUserUseCase fetchUserUseCase;
}
