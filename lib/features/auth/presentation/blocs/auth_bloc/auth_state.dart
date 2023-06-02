part of 'auth_bloc.dart';

enum AuthStateStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  failure
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStateStatus.initial,
    this.failure,
  });

  factory AuthState.initial() {
    return const AuthState();
  }

  final AuthStateStatus status;
  final Failure? failure;

  AuthState copyWith({
    AuthStateStatus? status,
    Failure? failure,
  }) {
    return AuthState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, failure];
}
