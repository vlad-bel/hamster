import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/temp/pos_raw.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@singleton
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit(this.useCase)
      : super(
          const BranchProfileState.init(
            avatarImages: [
              'https://growyournutritionbusiness.com/wp-content/uploads/2019/11/company-logo-test.jpg',
            ],
            isCreateBranchButtonEnabled: true,
          ),
        );

  final BranchProfileUseCase useCase;
  final formGroup = BranchProfileFormValidation().buildForm();
  final _formSettings = BranchProfileFormValidation();

  bool isCreateBranchButtonEnabled() {
    final name =
        formGroup.control(_formSettings.kFieldBranchName).value as String;
    final city = formGroup.control(_formSettings.kFieldCity).value as String;
    final street =
        formGroup.control(_formSettings.kFieldStreet).value as String;
    final website = formGroup
        .control(BranchProfileFormValidation.kFieldWebsite)
        .value as String;
    final entrancesCount =
        formGroup.control(_formSettings.kFieldEntrancesCount).value as String;

    final isInvalid = name.isEmptyOrNull &&
        city.isEmptyOrNull &&
        street.isEmptyOrNull &&
        website.isEmptyOrNull &&
        entrancesCount.isEmptyOrNull;
    return !isInvalid;
  }

  // TODO: add branch parameters
  Future<void> createBranch() async {
    await state.whenOrNull(
      init: (
        categoryParam,
        subcategoriesParam,
        branchImages,
        avatarImages,
        poses,
        hours,
        isCreateBranchButtonEnabled,
      ) async {
        final name =
            formGroup.control(_formSettings.kFieldBranchName).value as String?;

        const branchNumber = '0001'; // TODO: mock replace after Demo
        const country = 'Germany'; // TODO: mock replace after Demo
        const streetNumber = '111'; // TODO: mock replace after Demo
        const postalCode = '33111'; // TODO: mock replace after Demo
        final category = categoryParam ?? 'Restaurant';
        final subCategories = subcategoriesParam ?? [];

        final city =
            formGroup.control(_formSettings.kFieldCity).value as String?;

        final streetName =
            formGroup.control(_formSettings.kFieldStreet).value as String?;

        final website = formGroup
            .control(BranchProfileFormValidation.kFieldWebsite)
            .value as String?;

        final phoneNumber = formGroup
            .control(BranchProfileFormValidation.kFieldPhone)
            .value as String?;

        final posDatas = <PosData>[];
        poses?.forEach((pos) {
          for (var i = 0; i < pos.tillCount; i++) {
            final uuid = const Uuid().v4();
            posDatas.add(
              PosData(
                name: '$uuid$i',
                manufacturer: pos.manufacturer,
                model: pos.model,
                id: uuid,
                isActive: false,
              ),
            );
          }
        });

        final branchProfileDummy = BranchProfile(
          branchName: name,
          branchNumber: branchNumber,
          city: city,
          streetName: streetName,
          country: country,
          streetNumber: streetNumber,
          website: website,
          phoneNumber: phoneNumber,
          entrances: 1,
          postalCode: postalCode,
          category: category,
          openingHours: hours,
          posesData: posDatas,
          subcategories: subCategories,
        );

        try {
          await useCase.createBranch(branchProfileDummy);

          SnackBarManager.showSuccess('Branch profile was created');
          emit(const BranchProfileState.branchWasCreatedSuccessfully());
        } on ApiFailure catch (e) {
          logger.e('createBranch: $e');
          final errorMessage = e.response.message.toString();

          SnackBarManager.showError(errorMessage);
          // emit(const BranchProfileState.error(category: errorMessage));
        }
      },
    );
  }

  Future<void> updateBranch() async {
    // useCase.updateBranchById('id', branchProfile);
  }

  void setCategories({
    required String category,
    required List<String> subcategories,
  }) {
    emit(
      BranchProfileState.init(
        category: category,
        subcategories: subcategories,
        branchImages: state.branchImages,
        avatarImages: state.avatarImages,
        hours: state.hours,
        isCreateBranchButtonEnabled: state.isCreateBranchButtonEnabled,
      ),
    );
  }

  void setImages({
    required List<dynamic> branchImages,
    required List<dynamic> avatarImages,
  }) {
    uploadImage(branchImages);
    emit(
      BranchProfileState.init(
        category: state.category,
        subcategories: state.subcategories,
        branchImages: branchImages,
        avatarImages: avatarImages,
      ),
    );
  }

  void setOpeningHours({
    required OpeningHours hours,
  }) {
    state.whenOrNull(
      init: (
        category,
        subcategories,
        branchImages,
        avatarImages,
        poses,
        _,
        isCreateBranchButtonEnabled,
      ) {
        emit(state.copyWith(hours: hours));
      },
    );
  }

  void addPos({
    required PosRaw? pos,
  }) {
    if (pos == null) return;

    state.whenOrNull(
      init: (
        category,
        subcategories,
        branchImages,
        avatarImages,
        poses,
        hours,
        isCreateBranchButtonEnabled,
      ) {
        emit(
          state.copyWith(
            poses: (poses ?? [])..add(pos),
          ),
        );
      },
    );
  }

  Future uploadImage(List<dynamic> images) async {
    try {
      final pictureFiles = <AppFile>[];

      for (final image in images) {
        if (image is AppFile) {
          pictureFiles.add(image);
        }
      }

      await useCase.uloadBranchProfilePictures(pictureFiles);
      SnackBarManager.showSuccess('Uploaded!');
    } on DioError catch (e) {
      SnackBarManager.showError(e.message);
    }
  }

  void clearData() {
    emit(
      BranchProfileState.init(
        avatarImages: state.avatarImages,
      ),
    );
  }
}
