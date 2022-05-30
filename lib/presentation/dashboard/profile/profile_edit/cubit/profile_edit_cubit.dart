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

@injectable
class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit({
    required this.profileEditFormSettings,
    required this.profileEditUsecase,
  }) : super(
          const ProfileEditState.loading(),
        );

  final CompanyUsecase companyUsecase = getIt.get<CompanyUsecase>();
  final ProfileEditFormSettings profileEditFormSettings;
  final ProfileEditUsecase profileEditUsecase;

  Future<void> updatePaymentData(Map<String, String> values) async {
    emit(
      ProfileEditState.loading(),
    );
    _setControlValue(
      ProfileEditFormSettings.kAccountOwner,
      values[ProfileEditFormSettings.kAccountOwner],
    );
    _setControlValue(
      ProfileEditFormSettings.kIban,
      values[ProfileEditFormSettings.kIban],
    );

    final companyId = (await companyUsecase.getRepCompany()).company?.id;

    final company = await companyUsecase.getCompany(
      companyId: '$companyId',
    );

    emit(
      ProfileEditState.initial(
        company: company,
        profileEditFormSettings: profileEditFormSettings,
      ),
    );
    return;
  }

  Future<void> getInitialData() async {
    try {
      final companyId = (await companyUsecase.getRepCompany()).company?.id;
      final company = await companyUsecase.getCompany(
        companyId: '$companyId',
      );

      emit(
        ProfileEditState.loading(),
      );
      _setControlValue(
        ProfileEditFormSettings.kStreetField,
        '${company.streetName}',
      );
      _setControlValue(
        ProfileEditFormSettings.kAccountOwner,
        '${company.accountOwner}',
      );
      _setControlValue(
        ProfileEditFormSettings.kCompanyName,
        company.companyName,
      );

      _setControlValue(
        ProfileEditFormSettings.kIban,
        company.iban,
      );
      _setControlValue(
        ProfileEditFormSettings.kStreetNumberField,
        '${company.streetName}',
      );
      _setControlValue(
        ProfileEditFormSettings.kStreetNumberField,
        '${company.streetNumber}',
      );
      _setControlValue(
        ProfileEditFormSettings.kTaxNumber,
        '${company.taxNumber}',
      );
      _setControlValue(
        ProfileEditFormSettings.kPostcodeField,
        '${company.postalCode}',
      );
      _setControlValue(
        ProfileEditFormSettings.kCityField,
        '${company.city}',
      );
      _setControlValue(
        ProfileEditFormSettings.kAccountOwner,
        '${company.accountOwner}',
      );
      _setControlValue(
        ProfileEditFormSettings.kIban,
        '${company.iban}',
      );

      emit(
        ProfileEditState.initial(
          company: company,
          profileEditFormSettings: profileEditFormSettings,
        ),
      );
      return;
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(
        ProfileEditState.error(
          error: e,
        ),
      );
    }
  }

  Future<void> editProfile(
    String companyId, {
    required String countryCode,
    required String country,
  }) async {
    try {
      final profileEditRequest = ProfileEditRequest(
        city: '${getControlValue(
          ProfileEditFormSettings.kCityField,
        )}',
        commercialRegisterNumber: '${getControlValue(
          ProfileEditFormSettings.kCommercialRegisterNumber,
        )}',
        companyName: '${getControlValue(
          ProfileEditFormSettings.kCompanyName,
        )}',
        country: country,
        streetName: '${getControlValue(
          ProfileEditFormSettings.kStreetField,
        )}',
        countryCode: country,
        postalCode: '${getControlValue(
          ProfileEditFormSettings.kPostcodeField,
        )}',
        streetNumber: '${getControlValue(
          ProfileEditFormSettings.kStreetNumberField,
        )}',
        taxNumber: '${getControlValue(
          ProfileEditFormSettings.kTaxNumber,
        )}',
        vatId: '${getControlValue(
          ProfileEditFormSettings.kVatId,
        )}',
        accountOwner: '${getControlValue(
          ProfileEditFormSettings.kAccountOwner,
        )}',
        iban: '${getControlValue(
          ProfileEditFormSettings.kIban,
        )}',
      );

      await profileEditUsecase.editProfile(
        companyId,
        profileEditRequest,
      );

      state.whenOrNull(
        initial: (company, profileEditFormSettings) {
          emit(
            ProfileEditState.success(),
          );
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

  String? getControlValue(
    String key,
  ) {
    return profileEditFormSettings.controls[key]?.value;
  }

  void _setControlValue(String key, String? value) {
    if (value.toString() != null.toString()) {
      profileEditFormSettings.controls[key]!.value = value;
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

  const factory ProfileEditState.success() = SuccessProfileEditState;
}
