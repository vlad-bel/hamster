import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginUseCase)
class LoginUseCaseImpl extends LoginUseCase {
  LoginUseCaseImpl(this.repository);

  final RestClient repository;

  @override
  Future<String> login(LoginRequest request) {
    try {
      return repository.login(request.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e.response!.data as Map<String, dynamic>),
        'login',
      );
    }
  }
}
