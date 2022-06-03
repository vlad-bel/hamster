import 'dart:typed_data';

import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

class PictureModel {
  final XFile imageFile;
  final Uint8List imageBytes;

  PictureModel({
    required this.imageFile,
    required this.imageBytes,
  });
}

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

  Future<XFile?> pickImage(BuildContext context) async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (result != null) {
      final imageBytes = await result.readAsBytes();

      return result;
    }

    return null;
  }

  Future setImage({required XFile xFile}) async {
    final pictureModel = PictureModel(
      imageFile: xFile,
      imageBytes: await xFile.readAsBytes(),
    );

    final images = List.of(state.images ?? <String>[])..insert(0, pictureModel);

    return emit(BranchProfileAvatarPictureState.init(
      selectedImage: pictureModel,
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
