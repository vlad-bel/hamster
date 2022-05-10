import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/user_info_init.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserInfoInitUseCase)
class DefaultUserInfoInitUseCase implements UserInfoInitUseCase {
  DefaultUserInfoInitUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) async {
    try {
      final response = await apiService.initUserInfoCreation(request);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'initUserInfoCreation',
      );
    }
  }
}
