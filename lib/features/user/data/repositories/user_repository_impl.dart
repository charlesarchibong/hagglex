import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/core/errors/error.dart';
import 'package:hagglex/core/errors/failure.dart';
import 'package:hagglex/features/user/data/datasources/remote_datasource.dart';
import 'package:hagglex/features/user/domain/entities/user_entity.dart';
import 'package:hagglex/features/user/domain/repositories/user_repository.dart';
import 'package:logger/logger.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> register({
    String email,
    String password,
    String username,
    String phone,
    String referralCode,
  }) async {
    try {
      var response = await userRemoteDatasource.register(
        email: email,
        password: password,
        username: username,
        phone: phone,
        referralCode: referralCode,
      );
      return Right(response);
    } catch (e) {
      Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      } else if (e is OperationException) {
        return Left(
          ServerFailure(
            message: e.graphqlErrors[0].message,
          ),
        );
      } else {
        return Left(UnknownFailure());
      }
    }
  }
}
