import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/forget_password/send_verification_code_response.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  @factoryMethod
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @POST('/rep/login')
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> loginMap,
  );

  @POST('/rep/logout')
  Future<void> logout();

  @POST('/rep/init-creation')
  Future<String> initUserInfoCreation(
    @Body() Map<String, dynamic> userInfoMap,
  );

  @GET('/company/{id}')
  Future<Company> fetchCompany(
    @Path('id') String id,
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

  @POST('/rep/verify-phone-code-and-create')
  Future<String> verifyNumber(
    @Body() Map<String, dynamic> body,
  );

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

  @POST('/rep/send-verification-code')
  Future<SendVerificationCodeResponse> sendPhoneVerificationCode(
    @Body() Map<String, dynamic> sendVerificationCodeMap,
  );

  @POST('/rep/send-verification-code')
  Future<String> sendVerificationCode(
    @Body() Map<String, dynamic> sendVerificationCodeMap,
  );

  @POST('/rep/verify-phone-code')
  Future<String> verifyPhoneCode(
    @Body() Map<String, dynamic> sendVerifyPhoneCodeMap,
  );

  @POST('/company')
  Future<Company> createCompany(
    @Body() Map<String, dynamic> body,
  );

  @GET('/rep/company')
  Future<RepCompany> repCompany();

  @GET('/files/{filename}')
  Future getFileByName(
    @Path('filename') String filename,
  );

  // Branch Profile:

  // TODO: make page param as @query param during pagination implementation
  @GET('/branch/?page=1')
  Future<BranchProfileWithPaging> getBranchesByRepresentative();

  @GET('/branch/{id}')
  Future<BranchProfile> getBranchById(
    @Path('id') String id,
  );

  @PUT('/branch/{id}')
  Future<BranchProfile> updateBranchById(
    @Path('id') String id,
    @Body() Map<String, dynamic> branchProfile,
  );

  @POST('/branch')
  Future<BranchProfile> createBranch(
    @Body() Map<String, dynamic> branchProfile,
  );

  @GET('/common/categories')
  Future<List<String>> getCategories();

  @POST('/rep/change-password')
  Future changePassword(@Body() Map<String, dynamic> changePasswordMap);

  @POST('rep/reset-password')
  Future resetPassword(@Body() Map<String, dynamic> resetPasswordMap);
}
