import 'dart:async';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
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
    required this.addPaymentFormSettings,
  }) : super(
          const ProfileEditState.loading(),
        );

  final AddPaymentFormSettings addPaymentFormSettings;
  final CompanyUsecase companyUsecase = getIt.get<CompanyUsecase>();
  final List<AppColoredFile> files = [];
  final List<AppColoredFile> filesToUpload = [];
  final ProfileEditFormSettings profileEditFormSettings;
  final ProfileEditUsecase profileEditUsecase;

  Future<void> addImages(
    List<AppColoredFile> images, {
    bool withUpload = false,
  }) async {
    emit(
      const ProfileEditState.loading(),
    );
    final companyId = (await companyUsecase.getRepCompany()).company?.id;

    final company = await companyUsecase.getCompany(
      companyId: '$companyId',
    );
    if (withUpload) {
      filesToUpload.addAll(images);
    }
    files.addAll(images);

    emit(
      ProfileEditState.imagesAdded(
        company: company,
        profileEditFormSettings: profileEditFormSettings,
        image: files,
      ),
    );
  }

  Future<void> updatePaymentData(Map<String, String> values) async {
    emit(
      const ProfileEditState.loading(),
    );
    _setControlValue(
      ProfileEditFormSettings.kAccountOwner,
      values[ProfileEditFormSettings.kAccountOwner],
    );
    _setControlValue(
      ProfileEditFormSettings.kIban,
      values[ProfileEditFormSettings.kIban],
    );

    emit(
      ProfileEditState.paymentInfoAdded(
        accountOwner: values[ProfileEditFormSettings.kAccountOwner]!,
        iban: values[ProfileEditFormSettings.kIban]!,
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
        const ProfileEditState.loading(),
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
        ProfileEditFormSettings.kCommercialRegisterNumber,
        company.commercialRegisterNumber,
      );
      _setControlValue(
        ProfileEditFormSettings.kVatId,
        company.vatId,
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
      final addedImages = <AppColoredFile>[];
      /*for (final logo in company.logos ?? <CompanyLogo>[]) {
        if (logo.fileName != null) {
          try {
            addedImages.add(
              AppColoredFile(
                bytes: null,
                color: logo.backgroundColor,
                name: logo.fileName,
                extension: 'png',
              ),
            );
          } catch (e, s) {
            log('Error is $e, StackTrace is $s');
          }
        }
      }*/
      if (addedImages.isNotEmpty) {
        addImages(
          addedImages,
        );
      }

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
        backgrounds: [
          for (final file in filesToUpload) file.color,
        ],
      );

      await profileEditUsecase.editProfile(
        companyId,
        profileEditRequest,
        filesToUpload,
      );

      emit(
        const ProfileEditState.success(),
      );
      final company = await companyUsecase.getCompany(
        companyId: companyId,
      );
      emit(
        ProfileEditState.initial(
          company: company,
          profileEditFormSettings: profileEditFormSettings,
        ),
      );
      state.whenOrNull(
        initial: (company, profileEditFormSettings) {},
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

  String? getAddPaymentControlValue(
    String key,
  ) {
    return addPaymentFormSettings.controls[key]?.value.toString();
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
  }) = _$ErrorProfileEditState;

  const factory ProfileEditState.imagesAdded({
    required Company company,
    required ProfileEditFormSettings profileEditFormSettings,
    required List<AppColoredFile> image,
  }) = _$ImagesAddedProfileEditState;

  const factory ProfileEditState.initial({
    required Company company,
    required ProfileEditFormSettings profileEditFormSettings,
  }) = _$InitialProfileEditState;

  const factory ProfileEditState.loading() = _$LoadingProfileEditState;

  const factory ProfileEditState.paymentInfoAdded({
    required String accountOwner,
    required String iban,
  }) = _$PaymentInfoAddedProfileEditState;

  const factory ProfileEditState.success() = _$SuccessProfileEditState;
}
