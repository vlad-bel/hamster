import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_logo_cubit.freezed.dart';

@injectable
class AddLogoCubit extends Cubit<AddLogoState> {
  AddLogoCubit() : super(const AddLogoState.init());

  void selectImage(AppColoredFile? image) {
    emit(
      AddLogoState.init(
        selectedImage: image,
        images: state.images,
      ),
    );
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
      final file = result.files.first;
      return AppFile(
        bytes: file.bytes,
        size: file.size,
        name: file.name,
      );
    }

    return null;
  }

  void setImage({
    required AppColoredFile image,
  }) {
    if (state.images?.isNotEmpty == true) {
      state.images?.add(image);

      return emit(
        AddLogoState.init(
          selectedImage: image,
          images: state.images,
        ),
      );
    } else {
      final images = <AppColoredFile>[]..insert(
          0,
          image,
        );
      return emit(
        AddLogoState.init(
          selectedImage: image,
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
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = _$InitAddLogoState;

  const factory AddLogoState.loading({
    AppColoredFile? selectedImage,
    List<AppColoredFile>? images,
  }) = _$LoadingAddLogoState;
}
