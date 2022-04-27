import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://localhost:3003/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //region init user:
  @POST('/rep/init-creation')
  Future<String> initUserInfoCreation(
    @Body() Map<String, dynamic> userInfoMap,
  );

  //endregion

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
//endregion
}
