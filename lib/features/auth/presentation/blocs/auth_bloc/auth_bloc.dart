import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/auth/auth.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.fetchUserUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
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
        emit(state.copyWith(status: AuthStateStatus.unauthenticated));
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    /// LOGIN EVENT
    on<LoginEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await loginUseCase(
          LoginParams(email: event.email, password: event.password),
        );
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: AuthStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            if (r) {
              emit(state.copyWith(status: AuthStateStatus.authenticated));
            } else {
              emit(state.copyWith(status: AuthStateStatus.unauthenticated));
            }
          },
        );
      } catch (exception, stackTrace) {
        emit(state.copyWith(status: AuthStateStatus.unauthenticated));
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    /// LOGOUT EVENT
    on<LogoutEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await logoutUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(status: AuthStateStatus.unauthenticated));
          },
          (r) {
            emit(state.copyWith(status: AuthStateStatus.unauthenticated));
          },
        );
      } catch (exception, stackTrace) {
        emit(state.copyWith(status: AuthStateStatus.unauthenticated));
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    /// INITIALIZE EVENT
    on<InitializeAuthEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStateStatus.initial, failure: null));
    });
  }

  final FetchUserUseCase fetchUserUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
}
