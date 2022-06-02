import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';

abstract class BranchProfileUseCase {
  Future<BranchProfileWithPaging> getBranchesListByRepresentative();

  Future<BranchProfile> getBranchById(String id);

  Future<BranchProfile> updateBranchById(
    String id,
    BranchProfile branchProfile,
  );

  Future<BranchProfile> createBranch(BranchProfile branchProfile);
}
