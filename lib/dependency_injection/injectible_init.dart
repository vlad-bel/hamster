import 'package:business_terminal/dependency_injection/injectible_init.config.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Logger _logger;

Logger get logger => _logger;

final getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureDependencies() async {
  _logger = Logger();
  final prefs = await SharedPreferences.getInstance();
  getIt
    ..registerSingleton<Dio>(dio)
    ..registerSingleton(
      RestClient(
        getIt.get<Dio>(),
      ),
    )
    ..registerSingleton<SharedPreferences>(prefs);
  return $initGetIt(getIt);
}
