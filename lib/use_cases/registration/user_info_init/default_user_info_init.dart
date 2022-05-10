import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/user_info_init.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserInfoInitUseCase)
class DefaultUserInfoInitUseCase implements UserInfoInitUseCase {
  DefaultUserInfoInitUseCase(this._client);

  final RestClient _client;

  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) async {
    try {
      final req = request.toJson();
      final response = await _client.initUserInfoCreation(req);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'initUserInfoCreation',
      );
    }
  }
}
