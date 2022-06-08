import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileAvatarPictureCubit
    extends Cubit<BranchProfileAvatarPictureState> {
  BranchProfileAvatarPictureCubit()
      : super(
          const BranchProfileAvatarPictureState.init(),
        );

  void selectImage(AppColoredFile image) {
    emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: image,
        images: state.images,
      ),
    );
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

    return emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: appFile,
        images: images,
      ),
    );
  }

  void loading() {
    emit(
      BranchProfileAvatarPictureState.loading(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }

  void init() {
    emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }
}
