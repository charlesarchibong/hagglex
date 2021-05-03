import 'package:dartz/dartz.dart';
import 'package:hagglex/core/errors/failure.dart';
import 'package:hagglex/features/user/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> register({
    @required String email,
    @required String password,
    @required String username,
    @required String phone,
    String referralCode,
  });
}
