import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/file/app_image.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class EditPersonalDataCubit extends Cubit<EditPersonalDataState> {
  EditPersonalDataCubit() : super(EditPersonalDataState.mock());

  Future pickNewAvatar() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpeg',
      ],
      withData: true,
    );

    logger.d('Received image $result');
    if (result == null) return;

    emit(
      state.copyWith(
        avatar: AppImage.file(AppFile.fromFilePickerResult(result)),
      ),
    );
  }

  Future onImageCropped(Uint8List bytes) async {
    emit(
      state.copyWith(
        avatar: AppImage.file(
          AppFile(
            size: bytes.length,
            extension: '',
            name: null,
            bytes: bytes,
          ),
        ),
      ),
    );
  }
}
