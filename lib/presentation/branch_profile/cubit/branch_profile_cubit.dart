import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
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
          ),
        );

  final BranchProfileUseCase useCase;
  final formGroup = BranchProfileFormValidation().buildForm();

  // TODO: add branch parameters
  Future<void> createBranch() async {
    final branchProfileDummy = BranchProfile(
      branchName: 'Branch name',
      branchNumber: '1111',
      city: 'City',
      streetName: 'Street',
      country: 'Germany',
      streetNumber: '111',
      website: 'www.example.com',
      phoneNumber: '1234567890',
      entrances: 1,
      postalCode: '33111',
      category: 'Restaurant',
    );

    try {
      await useCase.createBranch(branchProfileDummy);

      SnackBarManager.showSuccess('Branch profile was created');
      emit(const BranchProfileState.branchWasCreatedSuccessfully());
    } on ApiFailure catch (e) {
      logger.e('createBranch: $e');
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> updateBranch() async {
    // useCase.updateBranchById('id', branchProfile);
  }

  void setCategories({
    required String category,
    required List<String> subcategories,
  }) {
    state.whenOrNull(
      init: (category, subcategories, branchImages, avatarImages) {
        emit(
          BranchProfileState.init(
            category: category,
            subcategories: subcategories,
            branchImages: branchImages,
            avatarImages: avatarImages,
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
}
