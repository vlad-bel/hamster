import 'dart:typed_data';

import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'add_logo_cubit.freezed.dart';

@injectable
class AddLogoCubit extends Cubit<AddLogoState> {
  AddLogoCubit() : super(const AddLogoState.init());

  void selectImage(AddedProfileLogoModel? imagePath) {
    emit(
      AddLogoState.init(
        selectedImage: imagePath,
        images: state.images,
      ),
    );
  }

  Future<AppFile?> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpeg', 'svg'],
      withData: true,
    );

    if (result != null) {
      final file = result.files.first;
      return AppFile(
        extension: file.extension,
        bytes: file.bytes,
        size: file.size,
        name: '',
      );
    }

    return null;
  }

  void setImage({
    required AddedProfileLogoModel addedProfileLogo,
  }) {
    if (state.images?.isNotEmpty == true) {
      state.images?.add(addedProfileLogo);

      return emit(
        AddLogoState.init(
          selectedImage: addedProfileLogo,
          images: state.images,
        ),
      );
    } else {
      final images = <AddedProfileLogoModel>[]..insert(
          0,
          addedProfileLogo,
        );
      return emit(
        AddLogoState.init(
          selectedImage: addedProfileLogo,
          images: images,
        ),
      );
    }
  }

  void loading() {
    emit(
      AddLogoState.loading(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }

  void init() {
    emit(
      AddLogoState.init(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }
}

@freezed
class AddLogoState with _$AddLogoState {
  const factory AddLogoState.init({
    AddedProfileLogoModel? selectedImage,
    List<AddedProfileLogoModel>? images,
  }) = _$InitAddLogoState;

  const factory AddLogoState.loading({
    AddedProfileLogoModel? selectedImage,
    List<AddedProfileLogoModel>? images,
  }) = _$LoadingAddLogoState;
}
