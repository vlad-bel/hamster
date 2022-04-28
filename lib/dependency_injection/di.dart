import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/repository/rest_api_repository.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/use_cases/registration/email_verification/default_email_verification.dart';
import 'package:business_terminal/use_cases/registration/email_verification/email_verification.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/default_user_info_init.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/user_info_init.dart';
import 'package:business_terminal/presentation/common/widgets/snackbar_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

late Logger _logger;

Logger get logger => _logger;

GetIt get = GetIt.instance;

abstract class DI {
  static void initializeDependencies() {
    _logger = Logger();
    final dio = httpClientInit();

    get
      ..registerSingleton<Dio>(dio)
      ..registerSingleton<RestClient>(RestClient(get<Dio>()))
      ..registerSingleton<ApiRepository>(
        RestApiRepository(get<RestClient>()),
      )
      ..registerSingleton<UserInfoInitUseCase>(
        DefaultUserInfoInitUseCase(get<ApiRepository>()),
      )
      ..registerSingleton<EmailVerificationUseCase>(
        DefaultEmailVerificationUseCase(get<ApiRepository>()),
      )
      ..registerSingleton<SnackBarManager>(SnackBarManager());
  }

  static Dio httpClientInit() {
    final prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
    );
    final dio = Dio()..interceptors.add(prettyDioLogger);
    return dio;
  }
}
