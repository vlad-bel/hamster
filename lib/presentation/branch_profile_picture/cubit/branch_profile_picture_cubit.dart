import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<AppFile?> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpeg',
        'bmp',
      ],
      withData: true,
    );

    if (result != null) {
      final file = AppFile(
        size: result.files.first.size,
        extension: result.files.first.extension,
        name: result.files.first.name,
        bytes: result.files.first.bytes,
      );

      return file;
    }

    return null;
  }

  Future setImage({required AppFile appFile}) async {
    final images = List.of(state.images ?? <String>[])
      ..insert(
        0,
        appFile,
      );

    return emit(BranchProfilePictureState.init(
      selectedImage: appFile,
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
