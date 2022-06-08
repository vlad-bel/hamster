import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfilePictureCubit extends Cubit<BranchProfilePictureState> {
  BranchProfilePictureCubit() : super(const BranchProfilePictureState.init());

  void selectImage(AppColoredFile imagePath) {
    emit(
      BranchProfilePictureState.init(
        selectedImage: imagePath,
        images: state.images,
      ),
    );
  }

  void removeSelectedImage(AppColoredFile imagePath) {
    final removedIndex = state.images!.indexOf(imagePath);
    final updatedImages = List.of(state.images!)
      ..removeWhere(
        (element) => element == imagePath,
      );

    final AppColoredFile? updatedSelectedImage;
    if (updatedImages.isNotEmpty) {
      final indexForRemove = removedIndex > 1 ? removedIndex - 1 : 0;
      updatedSelectedImage = updatedImages[indexForRemove];
    } else {
      updatedSelectedImage = null;
    }

    emit(
      BranchProfilePictureState.init(
        selectedImage: updatedSelectedImage,
        images: updatedImages,
      ),
    );
  }

  Future<AppColoredFile?> pickImage(BuildContext context) async {
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
      final file = AppColoredFile(
        name: null,
        bytes: result.files.first.bytes,
        color: null,
        extension: 'png',
      );

      return file;
    }

    return null;
  }

  Future setImage({required AppColoredFile appFile}) async {
    final images = List.of(state.images ?? <AppColoredFile>[])
      ..insert(
        0,
        appFile,
      );

    return emit(
      BranchProfilePictureState.init(
        selectedImage: appFile,
        images: images,
      ),
    );
  }

  void loading() {
    emit(
      BranchProfilePictureState.loading(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }

  void init() {
    emit(
      BranchProfilePictureState.init(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }
}
