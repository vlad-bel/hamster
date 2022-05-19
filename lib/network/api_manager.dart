import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/domain/repository/token/default_token_repository.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = httpClientInit();

final tokenRepository = DefaultTokenRepository();

Dio httpClientInit() {
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    compact: false,
  );

  final option = BaseOptions()
    ..headers = <String, dynamic>{
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };

  final dio = Dio(option)
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final accessToken = await tokenRepository.getAccessToken();
          if (accessToken != null) {
            option.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) async {
          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          try {
            return await _refreshToken(error, handler);
          } catch (e) {
            return handler.next(error);
          }
        },
      ),
    )
    ..interceptors.add(prettyDioLogger);

  return dio;
}

Future _refreshToken(
  DioError error,
  ErrorInterceptorHandler handler,
) async {
  if (error.response?.statusCode == 401 &&
      error.requestOptions.path != '/rep/login') {
    final opts = error.requestOptions;
    final oldRefreshToken = await tokenRepository.getRefreshToken();

    var response = await dio.post<dynamic>(
      'http://localhost:3003/api/rep/refresh',
      options: Options(
        method: 'POST',
        contentType: 'application/json',
        headers: <String, String>{
          'Authorization': 'Bearer ${oldRefreshToken ?? ''}',
        },
      ),
    );
    final loginResponse = LoginResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    await tokenRepository.setAccessToken(loginResponse.accessToken);
    await tokenRepository.setRefreshToken(loginResponse.refreshToken);

    response = await dio.request<dynamic>(
      opts.path,
      data: opts.data,
      queryParameters: opts.queryParameters,
      options: Options(
        method: opts.method,
        contentType: opts.contentType,
        headers: <String, String>{
          'Authorization': 'Bearer ${loginResponse.accessToken}',
        },
      ),
    );

    return handler.resolve(response);
  }

  return handler.next(error);
}
