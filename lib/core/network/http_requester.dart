import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hagglex/core/constants/env_constants.dart';
import 'package:logger/logger.dart';

class HttpServiceRequester {
  final Dio dio;

  HttpServiceRequester({
    @required this.dio,
  });

  Future<Response> post({
    @required String endpoint,
    String token,
    Object body,
    @required String contentType,
    Map queryParam,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    Logger().i(env[baseUrlEnv] + endpoint);

    final response = await dio.post(
      env[baseUrlEnv] + endpoint,
      data: body,
      queryParameters: queryParam,
      options: Options(
        contentType: contentType,
        // headers: {headers,
        // followRedirects: true,
      ),
    );
    return response;
  }

  Future<dynamic> getRequest({@required String endpoint, String token
      // Map queryParam,
      }) async {
    // Options _cacheOptions = buildCacheOptions(
    //   Duration(
    //     seconds: 40,
    //   ),
    // );
    // _cacheOptions = buildCacheOptions(
    //   Duration(
    //     minutes: 50,
    //   ),
    // );

    dio.options.headers['Authorization'] = 'Bearer $token';
    Logger().i(env[baseUrlEnv] + endpoint);

    final response = await dio.get(
      env[baseUrlEnv] + endpoint,
      // options: _cacheOptions,
    );
    return response;
  }
}
