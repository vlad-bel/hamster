import 'dart:typed_data';

import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

class PictureModel {
  PictureModel({
    required this.imageFile,
    required this.imageBytes,
  });

  final Uint8List imageBytes;
  final XFile imageFile;
}

@injectable
class BranchProfileAvatarPictureCubit
    extends Cubit<BranchProfileAvatarPictureState> {
  BranchProfileAvatarPictureCubit()
      : super(
          const BranchProfileAvatarPictureState.init(),
        );

  void selectImage(AppColoredFile imagePath) {
    emit(BranchProfileAvatarPictureState.init(
      selectedImage: imagePath,
      images: state.images,
    ));
  }

  Future<AppColoredFile?> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpeg',
      ],
      withData: true,
    );

    if (result != null) {
      final file = AppColoredFile(
        size: result.files.first.size,
        bytes: result.files.first.bytes,
        name: result.files.first.name,
        color: null,
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

    return emit(BranchProfileAvatarPictureState.init(
      selectedImage: appFile,
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
