import 'dart:convert';
import 'dart:io';

import 'package:business_terminal/domain/model/formdata/app_file_form_data.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/domain/repository/token/default_token_repository.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = httpClientInit();
final tokenRepository = DefaultTokenRepository();
const baseUrl = String.fromEnvironment(
  'base_url',
  defaultValue: 'https://35.158.96.146/api',
);
const appFileFormDataKey = 'app_file_form_data';
Dio httpClientInit() {
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    compact: false,
  );
  final option = BaseOptions(
    baseUrl: baseUrl,
  )..headers = <String, dynamic>{
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
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          final data = options.data as Map<String, dynamic>?;
          final formData = getFormDataFromBody(data);
          if (formData != null) {
            options.data = formData;
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
          return _refreshToken(error, handler);
        },
      ),
    )
    ..interceptors.add(prettyDioLogger);

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
}

Future<void> _refreshToken(
  DioError error,
  ErrorInterceptorHandler handler,
) async {
  if (error.response?.statusCode == 401 &&
      error.requestOptions.path != '/rep/login') {
    final oldRefreshToken = await tokenRepository.getRefreshToken();
    final response = await http.post(
      Uri.parse('$baseUrl/rep/refresh'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${oldRefreshToken ?? ''}',
      },
    );
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final loginResponse = LoginResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      await tokenRepository.setAccessToken(loginResponse.accessToken);
      await tokenRepository.setRefreshToken(loginResponse.refreshToken);
      final options = error.requestOptions;
      options.headers['Authorization'] = 'Bearer ${loginResponse.accessToken}';
      try {
        final data = options.data as Map<String, dynamic>?;
        final formData = getFormDataFromBody(data);
        if (formData != null) {
          options.data = formData;
        }
        final response = await request(options.data, options);
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.next(e);
      }
    }
    return handler.next(error);
  }
  return handler.next(error);
}

Future<Response> request(
  dynamic data,
  RequestOptions options,
) async {
  return dio.request<dynamic>(
    '$baseUrl${options.path}',
    data: data,
    queryParameters: options.queryParameters,
    options: Options(
      headers: options.headers,
      method: options.method,
      contentType: options.contentType,
      responseType: options.responseType,
    ),
  );
}

FormData? getFormDataFromBody(Map<String, dynamic>? data) {
  FormData? _formData;
  data?.forEach((key, value) {
    if (value is AppFilesFormData) {
      final formData = value.formData;
      final formFiles = value.appFiles;
      for (final formFile in formFiles) {
        final multipartFile = MultipartFile.fromBytes(
          formFile.bytes!,
          filename: formFile.name ?? '${DateTime.now()}.${formFile.extension}',
          contentType: MediaType(
            'image',
            formFile.extension,
          ),
        );
        formData.files.add(
          MapEntry(
            'files',
            multipartFile,
          ),
        );
      }
      _formData = formData;
    }
    if (value is AppFileFormData) {
      final formData = value.formData;
      final formFile = value.appFile;
      final multipartFile = MultipartFile.fromBytes(
        formFile.bytes!,
        filename: formFile.name ?? '${DateTime.now()}.${formFile.extension}',
        contentType: MediaType(
          'image',
          formFile.extension,
        ),
      );
      formData.files.add(
        MapEntry(
          'file',
          multipartFile,
        ),
      );
      _formData = formData;
    }
  });
  return _formData;
}
