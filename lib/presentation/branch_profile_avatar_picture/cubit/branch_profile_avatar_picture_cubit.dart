import 'dart:typed_data';

import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:file_picker/file_picker.dart';
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

  Future<AppFile?> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpeg',
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
