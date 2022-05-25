import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:business_terminal/use_cases/profile/profile_edit/profile_edit_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_edit_cubit.freezed.dart';

@singleton
class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit({
    required this.profileEditFormSettings,
    required this.profileEditUsecase,
  }) : super(
          const ProfileEditState.loading(),
        );

  final ProfileEditFormSettings profileEditFormSettings;
  final ProfileEditUsecase profileEditUsecase;

  void updatePaymentData(Map<String, String> values) {
    _setControlValue(
      ProfileEditFormSettings.kAccountOwner,
      values[ProfileEditFormSettings.kAccountOwner],
    );
    _setControlValue(
      ProfileEditFormSettings.kIban,
      values[ProfileEditFormSettings.kIban],
    );
  }

  void _setControlValue(String key, String? value) {
    if (value.toString() != null.toString()) {
      profileEditFormSettings.controls[key]!.value = value;
    }
  }

  Future<void> getInitialData() async {
    try {
      final result = getIt.get<CompanyUsecase>().repCompany;
      final company = result!.company;
      _setControlValue(
        ProfileEditFormSettings.kAccountOwner,
        '${company?.accountOwner}',
      );
      _setControlValue(
        ProfileEditFormSettings.kCompanyName,
        company?.companyName,
      );
      _setControlValue(
        ProfileEditFormSettings.kCommercialRegisterNumber,
        company?.companyNumber,
      );
      _setControlValue(
        ProfileEditFormSettings.kIban,
        company?.iban,
      );
      _setControlValue(
        ProfileEditFormSettings.kStreetHouseNumber,
        '${company?.streetName} ${company?.streetNumber}',
      );
      _setControlValue(
        ProfileEditFormSettings.kTaxNumber,
        '${company?.taxNumber}',
      );
      _setControlValue(
        ProfileEditFormSettings.kZipCodeAndLocation,
        '${company?.postalCode} ${company?.city}',
      );
      emit(
        ProfileEditState.initial(
          company: company!,
          profileEditFormSettings: profileEditFormSettings,
        ),
      );
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(
        ProfileEditState.error(
          error: e,
        ),
      );
    }
  }

  // TODO Implement functionality
  Future<void> editProfile(
    String companyId,
    ProfileEditRequest profileEditRequest,
  ) async {
    try {
      await profileEditUsecase.editProfile(
        companyId,
        profileEditRequest,
      );

      state.whenOrNull(
        initial: (company, profileEditFormSettings) {
          emit(
            ProfileEditState.initial(
              company: company,
              profileEditFormSettings: profileEditFormSettings,
            ),
          );
        },
      );
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(
        ProfileEditState.error(
          error: e,
        ),
      );
    }
  }
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.error({
    required ApiFailure error,
  }) = ErrorProfileEditState;

  const factory ProfileEditState.initial({
    required Company company,
    required ProfileEditFormSettings profileEditFormSettings,
  }) = InitialProfileEditState;

  const factory ProfileEditState.loading() = LoadingProfileEditState;

  const factory ProfileEditState.success({
    required Company company,
  }) = SuccessProfileEditState;
}
