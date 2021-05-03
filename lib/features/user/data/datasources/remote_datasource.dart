import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/core/errors/error.dart';
import 'package:hagglex/core/local_data/user_data/save_loggedin_user_data.dart';
import 'package:hagglex/core/local_data/user_token/get_user_logged_in_token.dart';
import 'package:hagglex/core/local_data/user_token/set_user_logged_in_token.dart';
import 'package:hagglex/core/network/graph_client.dart';
import 'package:hagglex/core/network/network_info.dart';
import 'package:hagglex/core/network/queries/mutation/mutation.dart' as mutaion;
import 'package:hagglex/features/user/data/models/user_model.dart';
import 'package:meta/meta.dart';

// ignore: one_member_abstracts
abstract class UserRemoteDatasource {
  Future<UserModel> register({
    @required String email,
    @required String password,
    @required String username,
    @required String phone,
    String referralCode,
  });
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final NetworkInfo networkInfo;
  final GraphQLClientConc graphQLClientConc;
  final SaveLoggedInUserData saveLoggedInUserData;
  final SaveLoggedInUserToken saveLoggedInUserToken;
  final GetLoggedInUserToken getLoggedInUserToken;

  UserRemoteDatasourceImpl({
    @required this.networkInfo,
    @required this.graphQLClientConc,
    @required this.saveLoggedInUserData,
    @required this.saveLoggedInUserToken,
    @required this.getLoggedInUserToken,
  });

  @override
  Future<UserModel> register({
    @required String email,
    @required String password,
    @required String username,
    @required String phone,
    String referralCode,
  }) async {
    if (await networkInfo.isConnected) {
      final _options = MutationOptions(
        document: parseString(mutaion.registerQuery),
        variables: <String, dynamic>{
          'input': {
            'username': username,
            'password': password,
            'email': email,
            'currency': 'NGN',
            'country': 'Nigeria',
            'phonenumber': phone,
          },
        },
      );

      var queryResult = await graphQLClientConc.mutate(_options);
      var user = UserModel.fromMap(
        queryResult.data['data']['register']['user'],
      );
      await saveLoggedInUserData(
        user,
      );
      await saveLoggedInUserToken(
        queryResult.data['data']['register']['token'],
      );
      return user;
    } else {
      throw NoInternetException();
    }
  }
}
