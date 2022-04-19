import 'package:business_terminal/data/gateway/rest_client.dart';
import 'package:business_terminal/data/service/rest_api_service.dart';
import 'package:business_terminal/domain/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

late Logger _logger;

Logger get logger => _logger;

GetIt get = GetIt.instance;

abstract class DI {
  static void initializeDependencies() {
    _logger = Logger();

    get
      ..registerSingleton<Dio>(Dio())
      ..registerSingleton<RestClient>(RestClient(get<Dio>()))
      ..registerSingleton<ApiService>(
        RestApiService(
          get<RestClient>(),
        ),
      );
  }
}
