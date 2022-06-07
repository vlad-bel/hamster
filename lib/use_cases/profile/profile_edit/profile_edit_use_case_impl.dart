import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/formdata/app_file_form_data.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:business_terminal/network/api_manager.dart';
import 'package:business_terminal/use_cases/profile/profile_edit/profile_edit_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileEditUsecase)
class ProfileEditUsecaseImpl extends ProfileEditUsecase {
  ProfileEditUsecaseImpl(this.repository);

  final RestClient repository;

  @override
  Future<bool> editProfile(
    String companyId,
    ProfileEditRequest profileEditRequest,
    List<AppFile> appFiles,
  ) async {
    try {
      final formData = AppFileFormData(
        formData: FormData.fromMap(
          profileEditRequest.toJson(),
        ),
        appFiles: appFiles,
      );

      // TODO(b.nurmoldanov) change hardcoded URI,
      await getIt.get<Dio>().put(
        'company/$companyId',
        data: {appFileFormDataKey: formData},
      );
      return true;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        StackTrace.current.toString(),
      );
    }
  }
}
