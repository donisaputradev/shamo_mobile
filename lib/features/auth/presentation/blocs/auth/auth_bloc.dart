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
    required this.registerUseCase,
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

    /// LOGIN EVENT
    on<LoginEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await loginUseCase(
          LoginParams(email: state.email.value, password: state.password.value),
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
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    /// REGISTER EVENT
    on<RegisterEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await registerUseCase(RegisterParams(
          email: state.email.value,
          password: state.password.value,
          name: state.name.value,
          phoneNumber: state.phoneNumber.value,
          username: state.username.value,
        ));
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
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    /// INITIALIZE EVENT
    on<InitializeAuthEvent>((event, emit) async {
      emit(state.copyWith(
        status: AuthStateStatus.initial,
        failure: null,
        email: null,
        name: null,
        password: null,
        phoneNumber: null,
        username: null,
      ));
    });

    /// CHANGE NAME EVENT
    on<ChangeNameEvent>((event, emit) async {
      final name = NameFormZ.dirty(event.name);
      emit(state.copyWith(status: AuthStateStatus.initial, name: name));
    });

    /// CHANGE USERNAME EVENT
    on<ChangeUsernameEvent>((event, emit) async {
      final username = NameFormZ.dirty(event.username);
      emit(state.copyWith(status: AuthStateStatus.initial, username: username));
    });

    /// CHANGE Email EVENT
    on<ChangeEmailEvent>((event, emit) async {
      final email = EmailFormZ.dirty(event.email);
      emit(state.copyWith(status: AuthStateStatus.initial, email: email));
    });

    /// CHANGE Phone EVENT
    on<ChangePhoneEvent>((event, emit) async {
      final phone = PhoneFormZ.dirty(event.phoneNumber);
      emit(state.copyWith(status: AuthStateStatus.initial, phoneNumber: phone));
    });

    /// CHANGE PASSWORD EVENT
    on<ChangePasswordEvent>((event, emit) async {
      final password = PasswordFormZ.dirty(event.password);
      emit(state.copyWith(status: AuthStateStatus.initial, password: password));
    });
  }

  final FetchUserUseCase fetchUserUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
}
