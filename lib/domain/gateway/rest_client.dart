import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_number_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

///todo add .env file
@RestApi(baseUrl: 'http://localhost:3003/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

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
}
