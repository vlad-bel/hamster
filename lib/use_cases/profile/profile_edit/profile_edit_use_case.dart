import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';

///UseCase for editing of user profile data
abstract class ProfileEditUsecase {
  ///edit created profile data
  Future<bool> editProfile(
    ///id of user company
    String companyId,

    ///profile creds
    ProfileEditRequest profileEditRequest,

    ///attached files (logo)
    List<AppFile> files,
  );
}
