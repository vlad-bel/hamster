import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_picture_state.freezed.dart';

@freezed
class BranchProfilePictureState with _$BranchProfilePictureState {
  const factory BranchProfilePictureState.init({
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = InitBranchProfilePictureState;

  const factory BranchProfilePictureState.loading({
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = LoadingBranchProfilePictureState;
}
