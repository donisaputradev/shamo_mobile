import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String username;
  final String phoneNumber;

  const User({
    required this.name,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, username, phoneNumber];
}
