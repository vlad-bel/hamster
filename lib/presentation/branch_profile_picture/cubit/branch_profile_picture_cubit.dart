import 'dart:typed_data';

import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfilePictureCubit extends Cubit<BranchProfilePictureState> {
  BranchProfilePictureCubit() : super(BranchProfilePictureState.init());

  void selectImage(dynamic imagePath) {
    emit(BranchProfilePictureState.init(
      selectedImage: imagePath,
      images: state.images,
    ));
  }

  void removeSelectedImage(dynamic imagePath) {
    final removedIndex = state.images!.indexOf(imagePath);
    final updatedImages = List.of(state.images!)
      ..removeWhere(
        (element) => element == imagePath,
      );

    final dynamic updatedSelectedImage;
    if (updatedImages.isNotEmpty) {
      final indexForRemove = removedIndex > 1 ? removedIndex - 1 : 0;
      updatedSelectedImage = updatedImages[indexForRemove];
    } else {
      updatedSelectedImage = null;
    }

    emit(BranchProfilePictureState.init(
      selectedImage: updatedSelectedImage,
      images: updatedImages,
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

    return emit(BranchProfilePictureState.init(
      selectedImage: imageBytes,
      images: images,
    ));
  }

  void loading() {
    emit(BranchProfilePictureState.loading(
      selectedImage: state.selectedImage,
      images: state.images,
    ));
  }

  void init() {
    emit(BranchProfilePictureState.init(
      selectedImage: state.selectedImage,
      images: state.images,
    ));
  }
}
