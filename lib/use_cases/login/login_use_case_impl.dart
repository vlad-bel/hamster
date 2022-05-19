import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginUseCase)
class LoginUseCaseImpl extends LoginUseCase {
  LoginUseCaseImpl(this.restClient, this.tokenRepository);

  final RestClient restClient;
  final TokenRepository tokenRepository;

  @override
  Future<void> login(LoginRequest request) async {
    try {
      final response = await restClient.login(request.toJson());
      await tokenRepository.setRefreshToken(response.refreshToken);
      await tokenRepository.setAccessToken(response.accessToken);
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'login',
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await restClient.logout();
      await tokenRepository.setRefreshToken(null);
      await tokenRepository.setAccessToken(null);
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'logout',
      );
    }
  }
}
