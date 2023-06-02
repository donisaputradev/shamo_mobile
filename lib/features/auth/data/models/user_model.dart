import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/features/auth/auth.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String username;
  final String phoneNumber;

  const UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  User toEntity() {
    return User(
      name: name,
      email: email,
      username: username,
      phoneNumber: phoneNumber,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        username: json['username'],
        phoneNumber: json['phone_number'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'phone_number': phoneNumber,
    };
  }

  @override
  List<Object?> get props => [name, email, username, phoneNumber];
}
