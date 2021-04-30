import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hagglex/core/local_data/user_data/delete_user_session.dart';
import 'package:hagglex/core/local_data/user_token/get_user_logged_in_token.dart';
import 'package:hagglex/core/local_data/user_token/set_user_logged_in_token.dart';
import 'package:hagglex/core/navigations/navigation_service.dart';
import 'package:hagglex/core/network/http_requester.dart';
import 'package:hagglex/core/network/network_info.dart';

import 'core/local_data/user_data/get_loggedin_user_data.dart';
import 'core/local_data/user_data/save_loggedin_user_data.dart';
import 'core/local_data/user_token/save_fresh_token.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  //******************* Dependecences *************************

  // sl.registerLazySingleton(() => DioCacheManager(
  //       CacheConfig(),
  //     ));
  final storage = FlutterSecureStorage();

  sl.registerLazySingleton(
    () => HttpServiceRequester(
      dio: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => Connectivity(),
  );

  sl.registerLazySingleton(
    () => Dio(),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  //********************** core */

  sl.registerLazySingleton<SaveLoggedInUserData>(
    () => SaveLoggedInUserDataImpl(
      storage,
    ),
  );

  sl.registerSingleton<GetLoggedInUserData>(
    GetLoggedInUserDataImpl(
      storage,
    ),
  );

  sl.registerLazySingleton<SaveRefreshToken>(
    () => SaveRefreshTokenImpl(
      storage,
    ),
  );

  sl.registerLazySingleton<GetRefreshToken>(
    () => GetRefreshTokenImpl(
      storage,
    ),
  );

  sl.registerLazySingleton<GetLoggedInUserToken>(
    () => GetLoggedInUserTokenImpl(
      storage,
    ),
  );
  sl.registerLazySingleton<SaveLoggedInUserToken>(
    () => SaveLoggedInUserTokenImpl(
      storage,
    ),
  );

  sl.registerLazySingleton<DeleteUserSession>(
    () => DeleteUserSessionImpl(storage),
  );

  //******************* Usecases *************************
  //
  //

  //******************* Data sources *************************
  //

  //******************* Repositories *************************

  //******************* Providers *************************

  //******************* Services *************************
  sl.registerLazySingleton(() => NavigationService());
}
