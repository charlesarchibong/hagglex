import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserEntity extends Equatable {
  final String email;
  final String username;
  final String phone;
  UserEntity({
    @required this.email,
    @required this.username,
    @required this.phone,
  });

  @override
  List<Object> get props => [email, username, phone];
}
