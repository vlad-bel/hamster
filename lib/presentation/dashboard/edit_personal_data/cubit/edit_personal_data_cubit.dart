import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/file/app_image.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_state.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/form_validation_rules/edit_personal_data_form_group.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:business_terminal/use_cases/edit_personal_data/edit_personal_data_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EditPersonalDataCubit extends Cubit<EditPersonalDataState> {
  final EditPersonalDataUseCase _useCase;
  final CountryCodeSelectorCubit countryCodeSelectorCubit;

  final form = EditPersonalDataFormGroup().buildForm();

  EditPersonalDataCubit(this._useCase, this.countryCodeSelectorCubit)
      : super(EditPersonalDataState.initial()) {
    _loadPersonalData();
  }

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

  Future _loadPersonalData() async {
    try {
      final result = await _useCase.getPersonalData();
      emit(
        state.copyWith(
          avatar: result.avatar == null ? null : AppImage.file(result.avatar!),
        ),
      );
      form.value = {
        EditPersonalDataFormGroup.kFieldName: result.firstName,
        EditPersonalDataFormGroup.kFieldSurname: result.lastName,
        EditPersonalDataFormGroup.kFieldPhone: result.phone,
        EditPersonalDataFormGroup.kFieldEmail: result.email
      };
      countryCodeSelectorCubit.setPhoneNumber(result.phone);
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }
}
