import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ApiRepository)
class RestApiRepository extends ApiRepository {
  RestApiRepository(this._client);

  final RestClient _client;

  // TODO: remove all methods and move to use-case in next task
  // as it takes too much time now + out of scope of login task
  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) async {
    final requestJson = request.toJson();
    final response = await _client.initUserInfoCreation(requestJson);

    return response;
  }

  @override
  Future<String> emailVerification(EmailVerificationRequest request) async {
    final requestJson = request.toJson();
    final response = await _client.verifyEmailCode(requestJson);

    return response;
  }

  @override
  Future<String> resendEmailCode(ResendEmailCodeRequest request) async {
    final requestJson = request.toJson();
    final response = await _client.resendEmailCode(requestJson);

    return response;
  }
}