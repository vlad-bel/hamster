import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_number_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

///todo add .env file
@RestApi(baseUrl: 'http://localhost:3003/api/')
abstract class RestClient {
  @factoryMethod
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @POST('/rep/login')
  Future<String> login(
    @Body() Map<String, dynamic> loginMap,
  );

  @POST('/rep/init-creation')
  Future<String> initUserInfoCreation(
    @Body() Map<String, dynamic> userInfoMap,
  );

  @GET('/common/countries')
  Future<Map<String, Country>> getCountries();

  @POST('/rep/verify-phone-by')
  Future<void> verifyPhoneBy(
    @Body() Map<String, dynamic> body,
  );

  @POST('/rep/phone')
  Future<void> createPhone(
    @Body() Map<String, dynamic> body,
  );

  @POST('/rep/verify-sms-code')
  Future<VerifyNumberResponse> verifyNumber(
    @Body() Map<String, dynamic> body,
  );

  // verify email:
  //region verify email:
  @POST('/rep/verify-email-code')
  Future<String> verifyEmailCode(
    @Body() Map<String, dynamic> emailCodeMap,
  );

  @POST('/rep/resend-code-to-email')
  Future<String> resendEmailCode(
    @Body() Map<String, dynamic> resendEmailCodeMap,
  );

  @POST('/rep/resend-code-to-phone')
  Future<String> resendSMSCode(
    @Body() Map<String, dynamic> resendEmailCodeMap,
  );
}
