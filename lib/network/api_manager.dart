import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// LOGS
enum LogLevel {
  /// Only print input and output requests
  IN_OUT,

  /// Print all log information
  IN_OUT_DETAIL
}

Dio httpClientInit() {
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    compact: false,
  );
  final dio = Dio()..interceptors.add(prettyDioLogger);
  return dio;
}

class ApiManager {
  ApiManager() {
    dio = Dio(_defaultOption())
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
          onError: (error, handler) async {
            // _refreshToken(error, handler);
          },
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: false,
        ),
      );
  }

  late Dio dio;

  /// GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      debugPrint('path $path');
      debugPrint('queryParameters $queryParameters');

      final response = await dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: await _checkOptions('GET', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// POST
  Future<Response> post(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path - $path');
    debugPrint('data - $data');

    try {
      final response = await dio.post<dynamic>(
        path,
        data: data,
        options: await _checkOptions('POST', options),
        cancelToken: cancelToken,
      );

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// PATCH
  Future<Response> patch(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.patch<dynamic>(
        path,
        data: data,
        options: await _checkOptions('PATCH', options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// PUT
  Future<Response> put(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path $path');

    try {
      final response = await dio.put<dynamic>(
        path,
        data: data,
        options: await _checkOptions('PUT', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// DELETE
  Future<Response> delete(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    debugPrint('path $path');

    try {
      final response = await dio.delete<dynamic>(
        path,
        data: data,
        options: await _checkOptions('DELETE', options),
        cancelToken: cancelToken,
      );

      debugPrint('realUri ${response.realUri}');
      debugPrint('response $response');

      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// other request
  Future<Response> request(
    String method,
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.request<dynamic>(
        path,
        data: data,
        options: await _checkOptions(method, options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// check Options.
  Future<Options> _checkOptions(
    String method,
    Options? options,
  ) async {
    if (options == null) {
      final headers = <String, dynamic>{
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest'
      };

      final options = Options(
        method: method,
        contentType: 'application/json',
        headers: headers,
      );

      return options;
    }
    return options;
  }

  /// Reset configuration information
  void resetConfig(BaseOptions? option) {
    if (option != null) {
      dio.options = option;
    }
  }

  /// Set log printing
  void enableLog(LogLevel ll) {
    if (ll == LogLevel.IN_OUT) {
    } else if (ll == LogLevel.IN_OUT_DETAIL) {
      dio.interceptors.add(LogInterceptor());
    } else {}
  }

  /// Default basic configuration
  static BaseOptions _defaultOption() {
    final option = BaseOptions()
      ..headers = <String, dynamic>{
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest'
      };
    return option;
  }
}
