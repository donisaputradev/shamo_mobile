part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.username,
  });

  final String name;
  final String username;
  final String phoneNumber;
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password, name, username, phoneNumber];
}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class InitializeAuthEvent extends AuthEvent {}
