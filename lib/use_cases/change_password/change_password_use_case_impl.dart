import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/change_password/change_password_request.dart';
import 'package:business_terminal/use_cases/change_password/change_password_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordUseCase)
class ChangePasswordUseCaseImpl extends ChangePasswordUseCase {
  ChangePasswordUseCaseImpl(this._client);

  final RestClient _client;

  @override
  Future changePassword(ChangePasswordRequest request) async {
    try {
      await _client.changePassword(request.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'change_password',
      );
    }
  }

}