import 'dart:convert';

import 'package:hagglex/features/user/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

class UserModel extends UserEntity {
  @override
  final String email;

  @override
  final String username;

  @override
  final String phone;

  UserModel({
    @required this.email,
    @required this.username,
    @required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phonenumber': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      username: map['username'],
      phone: map['phonenumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
