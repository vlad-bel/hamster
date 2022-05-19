import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/use_cases/profile/profile_edit/profile_edit_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProfileEditUsecase)
class ProfileEditUsecaseImpl extends ProfileEditUsecase {
  @override
  Future<void> editProfile() async {
    try {
      return await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        // TODO Check if it's works
        StackTrace.current.toString(),
      );
    }
  }

  // TODO Implement other functionality
  @override
  Future<void> foo() async {
    try {} on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'foo',
      );
    }
  }
}
