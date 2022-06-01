import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@singleton
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit()
      : super(
          BranchProfileState.init(

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

  final FormGroup formGroup = BranchProfileFormValidation().buildForm();

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
    } catch (e) {
      logger.e('createBranch: $e');
    }

    /*BranchProfile branchProfile = BranchProfile(
      id: 'id',
      branchName: 'branchName',
      city: 'city',
      country: country,
      postalCode: postalCode,
      streetName: streetName,
      streetNumber: streetNumber,
      entrances: entrances,
      website: website,
      phoneNumber: phoneNumber,
      companyId: companyId,
      branchNumber: branchNumber,
      fillingProgress: fillingProgress,
      posesData: posesData,
      category: category,
      subcategories: subcategories,
      openingHours: openingHours,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isVerificationRequestDeclined: isVerificationRequestDeclined,
      isVerified: isVerified,
    );*/

    // useCase.createBranch(branchProfile);
  }

  Future<void> updateBranch() async {
    /* BranchProfile branchProfile = BranchProfile(
      id: id,
      branchName: branchName,
      city: city,
      country: country,
      postalCode: postalCode,
      streetName: streetName,
      streetNumber: streetNumber,
      entrances: entrances,
      website: website,
      phoneNumber: phoneNumber,
      companyId: companyId,
      branchNumber: branchNumber,
      fillingProgress: fillingProgress,
      posesData: posesData,
      category: category,
      subcategories: subcategories,
      openingHours: openingHours,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isVerificationRequestDeclined: isVerificationRequestDeclined,
      isVerified: isVerified,
    );*/

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
      ),
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
