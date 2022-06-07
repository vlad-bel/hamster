import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/file/app_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_personal_data_state.freezed.dart';

@freezed
class EditPersonalDataState with _$EditPersonalDataState {
  const factory EditPersonalDataState({
    required String firstName,
    required String lastName,
    required AppImage? avatar,
    required bool loading,
    required String email,
    required Country? phoneCountry,
    required String phoneNumber,
    required Country? residency,
  }) = _EditPersonalDataState;

  factory EditPersonalDataState.initial() => const EditPersonalDataState(
      firstName: '',
      lastName: '',
      avatar: null,
      loading: true,
      email: '',
      phoneCountry: null,
      phoneNumber: '',
      residency: null);
}
