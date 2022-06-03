import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/logo.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:business_terminal/use_cases/profile/profile_edit/profile_edit_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_parser/http_parser.dart';
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
  final List<AddedProfileLogoModel> files = [];
  final List<AddedProfileLogoModel> filesToUpload = [];
  final ProfileEditFormSettings profileEditFormSettings;
  final ProfileEditUsecase profileEditUsecase;

  Future<void> addImages(
    List<AddedProfileLogoModel> images, {
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
      final addedImages = <AddedProfileLogoModel>[];
      for (final logo in company.logos ?? <CompanyLogo>[]) {
        if (logo.fileName != null) {
          try {
            final result = await getIt
                .get<RestClient>()
                .getFileByName(logo.fileName!) as Map<String, dynamic>;
            if (result['buffer'] != null) {
              addedImages.add(
                AddedProfileLogoModel(
                  imageBytes: Uint8List.fromList(
                    List<int>.from(result['buffer']!['data'] as List<dynamic>),
                  ),
                  backgroundColorModel: BackgroundColorModel(
                    colorHex: '${logo.backgroundColor}',
                    colorTitle: '${logo.backgroundColor}',
                  ),
                ),
              );
            }
          } catch (e, s) {}
        }
      }
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
          for (int i = 0; i < 10; i++) 'blue',
          // for (final file in filesToUpload)
          // if (file.color != null) file.color!,
        ],
      );
      final uploadedFiles = <MultipartFile>[];
      for (final file in filesToUpload) {
        uploadedFiles.add(
          MultipartFile.fromBytes(
            file.imageBytes,
            filename: '${DateTime.now()}.png',
            contentType: MediaType(
              'image',
              'png',
            ),
          ),
        );
      }
      await profileEditUsecase.editProfile(
        companyId,
        profileEditRequest,
        uploadedFiles,
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
  }) = ErrorProfileEditState;

  const factory ProfileEditState.imagesAdded({
    required Company company,
    required ProfileEditFormSettings profileEditFormSettings,
    required List<AddedProfileLogoModel> image,
  }) = ImagesAddedProfileEditState;

  const factory ProfileEditState.initial({
    required Company company,
    required ProfileEditFormSettings profileEditFormSettings,
  }) = InitialProfileEditState;

  const factory ProfileEditState.loading() = LoadingProfileEditState;

  const factory ProfileEditState.success() = SuccessProfileEditState;
}
