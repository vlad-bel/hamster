import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_picture_state.freezed.dart';

@freezed
class BranchProfilePictureState with _$BranchProfilePictureState {
  const factory BranchProfilePictureState.init({
    dynamic? selectedImage,
    List<dynamic>? images,
  }) = InitBranchProfilePictureState;

  const factory BranchProfilePictureState.loading({
    dynamic? selectedImage,
    List<dynamic>? images,
  }) = LoadingBranchProfilePictureState;
}
