import 'package:business_terminal/data/gateway/rest_client.dart';
import 'package:business_terminal/data/repository/rest_api_repository.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/use_cases/user_info_init_use_case.dart';
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
      ..registerSingleton<ApiRepository>(
        RestApiRepository(
          get<RestClient>(),
        ),
      )
      ..registerSingleton<UserInfoInitUseCase>(
        DefaultUserInfoInitUseCase(get<ApiRepository>()),
      );
  }
}
