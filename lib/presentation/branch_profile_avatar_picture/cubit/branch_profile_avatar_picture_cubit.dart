import 'dart:typed_data';

import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileAvatarPictureCubit
    extends Cubit<BranchProfileAvatarPictureState> {
  BranchProfileAvatarPictureCubit()
      : super(BranchProfileAvatarPictureState.init());

  void selectImage(dynamic imagePath) {
    emit(BranchProfileAvatarPictureState.init(
      selectedImage: imagePath,
      images: state.images,
    ));
  }

  Future<Uint8List?> pickImage(BuildContext context) async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (result != null) {
      final imageBytes = await result.readAsBytes();

      return imageBytes;
    }

    return null;
  }

  void setImage({required Uint8List imageBytes}) {
    final images = List.of(state.images ?? <String>[])..insert(0, imageBytes);

    return emit(BranchProfileAvatarPictureState.init(
      selectedImage: imageBytes,
      images: images,
    ));
  }

  void loading() {
    emit(BranchProfileAvatarPictureState.loading(
      selectedImage: state.selectedImage,
      images: state.images,
    ));
  }

  void init() {
    emit(BranchProfileAvatarPictureState.init(
      selectedImage: state.selectedImage,
      images: state.images,
    ));
  }
}
