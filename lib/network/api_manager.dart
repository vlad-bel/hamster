import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) async {
          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          // _refreshToken(error);
          return handler.next(error);

          ///TODO refresh token interceptor
        },
      ),
    )
    ..interceptors.add(prettyDioLogger);

  return dio;
}

void _refreshToken(DioError error) {
  if (error.response?.statusCode == 401) {
    logger.d('Token error: $error');
  }
}
