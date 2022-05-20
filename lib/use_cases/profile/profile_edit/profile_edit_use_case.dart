import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';

abstract class ProfileEditUsecase {
  // TODO replace variables to DTO
  /// Edits profile by passing required non-nullable values
  Future<void> editProfile(
    String companyId,
    ProfileEditRequest profileEditRequest,
  );

  // TODO Implement other functionality
  Future<void> foo();
}
