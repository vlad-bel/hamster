import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'injectible_init.config.dart';

late Logger _logger;

Logger get logger => _logger;

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() {
  _logger = Logger();
  getIt
    ..registerSingleton<Dio>(httpClientInit())
    ..registerSingleton(
      RestClient(
        getIt.get<Dio>(),
      ),
    );
  return $initGetIt(getIt);
}
