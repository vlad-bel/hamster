import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_avatar_picture_state.freezed.dart';

@freezed
class BranchProfileAvatarPictureState with _$BranchProfileAvatarPictureState {
  const factory BranchProfileAvatarPictureState.init({
    dynamic? selectedImage,
    List<dynamic>? images,
  }) = InitBranchProfileAvatarPictureState;

  const factory BranchProfileAvatarPictureState.loading({
    dynamic? selectedImage,
    List<dynamic>? images,
  }) = LoadingBranchProfileAvatarPictureState;
}
