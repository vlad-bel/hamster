import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit(this.useCase)
      : super(
          const BranchProfileState.init(
            ///todo mock images
            branchImages: [
              'https://cdn.cnn.com/cnnnext/dam/assets/211105205533-01-georgia-travel-file-full-169.jpg',
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/24701-nature-natural-beauty.jpg/1280px-24701-nature-natural-beauty.jpg',
              'https://ds.static.rtbf.be/article/image/1248x702/2/1/b/7e32a07d16f1e5929d06b65594dfb643-1563791453.jpg',
            ],
            avatarImages: [
              'https://static.stacker.com/s3fs-public/styles/slide_desktop/s3/pepsi.png',
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
    final website =
        formGroup.control(_formSettings.kFieldWebsite).value as String;
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

        final website =
            formGroup.control(_formSettings.kFieldWebsite).value as String?;

        final phoneNumber =
            formGroup.control(_formSettings.kFieldPhone).value as String?;

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
    state.whenOrNull(
      init: (
        category,
        subcategories,
        branchImages,
        avatarImages,
        hours,
        isCreateBranchButtonEnabled,
      ) {
        emit(
          BranchProfileState.init(
            category: category,
            subcategories: subcategories,
            branchImages: branchImages,
            avatarImages: avatarImages,
            hours: hours,
          ),
        );
      },
    );
  }

  void setImages({
    required List<dynamic> branchImages,
    required List<dynamic> avatarImages,
  }) {
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
        hours,
        isCreateBranchButtonEnabled,
      ) {
        emit(
          BranchProfileState.init(
            category: category,
            subcategories: subcategories,
            branchImages: branchImages,
            avatarImages: avatarImages,
            hours: hours,
          ),
        );
      },
    );
  }
}
