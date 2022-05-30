import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';

abstract class BranchProfileUseCase {
  Future<List<BranchProfile>> getBranchByRepresentative();

  Future<BranchProfile> getBranchById(String id);

  Future<BranchProfile> updateBranchById(
    String id,
    BranchProfile branchProfile,
  );

  Future<BranchProfile> createBranch(BranchProfile branchProfile);
}
