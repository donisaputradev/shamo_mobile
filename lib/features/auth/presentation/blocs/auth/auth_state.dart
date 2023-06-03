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
    this.email = const EmailFormZ.dirty(),
    this.name = const NameFormZ.dirty(),
    this.username = const NameFormZ.dirty(),
    this.password = const PasswordFormZ.dirty(),
    this.phoneNumber = const PhoneFormZ.dirty(),
  });

  factory AuthState.initial() {
    return const AuthState();
  }

  bool get isRegisterFormValid =>
      (name.value.isNotEmpty && name.isValid) &&
      (email.value.isNotEmpty && email.isValid) &&
      (password.value.isNotEmpty && password.isValid);

  bool get isLoginFormValid =>
      (email.value.isNotEmpty && email.isValid) &&
      (password.value.isNotEmpty && password.isValid);

  final AuthStateStatus status;
  final Failure? failure;
  final NameFormZ name;
  final NameFormZ username;
  final PhoneFormZ phoneNumber;
  final PasswordFormZ password;
  final EmailFormZ email;

  AuthState copyWith({
    AuthStateStatus? status,
    Failure? failure,
    NameFormZ? name,
    NameFormZ? username,
    PhoneFormZ? phoneNumber,
    PasswordFormZ? password,
    EmailFormZ? email,
  }) {
    return AuthState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [
        status,
        failure,
        name,
        username,
        email,
        phoneNumber,
        password,
      ];
}
