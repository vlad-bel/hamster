import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';

abstract class ProfileEditUsecase {
  Future<bool> editProfile(
    String companyId,
    ProfileEditRequest profileEditRequest,
    List<AppFile> files,
  );
}
