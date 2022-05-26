import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_picture_state.freezed.dart';

@freezed
class BranchProfilePictureState with _$BranchProfilePictureState {
  const factory BranchProfilePictureState.init({
    String? selectedImage,
    List<String>? images,
  }) = InitBranchProfilePictureState;
}
