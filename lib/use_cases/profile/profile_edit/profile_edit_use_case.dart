import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:dio/dio.dart';

abstract class ProfileEditUsecase {
  Future<bool> editProfile(
    String companyId,
    ProfileEditRequest profileEditRequest,
    List<MultipartFile> files,
  );
}
