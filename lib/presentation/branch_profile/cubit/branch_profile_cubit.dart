import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

@singleton
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit(this.useCase) : super(BranchProfileState.init());

  final BranchProfileUseCase useCase;

  final FormGroup formGroup = BranchProfileFormValidation().buildForm();

  Future<void> createBranch() async {
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
      ),
    );
  }
}
