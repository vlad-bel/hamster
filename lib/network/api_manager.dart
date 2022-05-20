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
      'X-Requested-With': 'XMLHttpRequest',
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
          return await _refreshToken(error, handler);
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
    final oldRefreshToken = await tokenRepository.getRefreshToken();

    final refreshResponse = await dio.post<dynamic>(
      'http://localhost:3003/api/rep/refresh',
      options: Options(
        method: 'POST',
        contentType: 'application/json',
        headers: <String, String>{
          'Authorization': 'Bearer ${oldRefreshToken ?? ''}',
        },
      ),
    );

    if (refreshResponse.statusCode! >= 200 &&
        refreshResponse.statusCode! <= 300) {
      final loginResponse = LoginResponse.fromJson(
        refreshResponse.data as Map<String, dynamic>,
      );

      await tokenRepository.setAccessToken(loginResponse.accessToken);
      await tokenRepository.setRefreshToken(loginResponse.refreshToken);

      final options = error.requestOptions;

      options.headers['Authorization'] = 'Bearer ${loginResponse.accessToken}';
      options.headers['content-type'] = 'application/json';

      try {
        final newResponse = await dio.request<dynamic>(
          'http://localhost:3003/api${options.path}',
          options: Options(
            headers: options.headers,
            method: options.method,
            contentType: options.contentType,
            responseType: options.responseType,
          ),
        );

        return handler.resolve(newResponse);
      } on DioError catch (e) {
        return handler.next(e);
      }
    }

    return handler.next(error);
  }

  return handler.next(error);
}
