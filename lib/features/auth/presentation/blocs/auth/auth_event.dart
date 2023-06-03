part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class InitializeAuthEvent extends AuthEvent {}

class ChangeNameEvent extends AuthEvent {
  final String name;

  const ChangeNameEvent(this.name);

  @override
  List<Object> get props => [name];
}

class ChangeUsernameEvent extends AuthEvent {
  final String username;

  const ChangeUsernameEvent(this.username);

  @override
  List<Object> get props => [username];
}

class ChangePhoneEvent extends AuthEvent {
  final String phoneNumber;

  const ChangePhoneEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class ChangeEmailEvent extends AuthEvent {
  final String email;

  const ChangeEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ChangePasswordEvent extends AuthEvent {
  final String password;

  const ChangePasswordEvent(this.password);

  @override
  List<Object> get props => [password];
}
