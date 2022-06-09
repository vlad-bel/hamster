import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_avatar_picture_state.freezed.dart';

@freezed
class BranchProfileAvatarPictureState with _$BranchProfileAvatarPictureState {
  const factory BranchProfileAvatarPictureState.init({
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = InitBranchProfileAvatarPictureState;

  const factory BranchProfileAvatarPictureState.loading({
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = LoadingBranchProfileAvatarPictureState;
}
