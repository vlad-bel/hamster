import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
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
    List<MultipartFile> files,
  ) async {
    try {
      final formData = FormData.fromMap(
        profileEditRequest.toJson(),
      );
      for (final file in files) {
        formData.files.addAll(
          {
            MapEntry(
              'files',
              file,
            ),
          },
        );
      }

      // TODO(b.nurmoldanov) change hardcoded URI,
      await getIt.get<Dio>().put(
            'http://localhost:3003/api/company/$companyId',
            data: formData,
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
