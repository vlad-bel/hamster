import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:dio/dio.dart';

///UseCase for branches management.
abstract class BranchProfileUseCase {
  /// get BranchProfile list by token
  Future<BranchProfileWithPaging> getBranchesListByRepresentative();

  ///get BranchProfile by Id
  Future<BranchProfile> getBranchById(String id);

  ///update existing branch
  Future<BranchProfile> updateBranchById(
    String id,
    BranchProfile branchProfile,
  );

  /// create new branch
  Future<BranchProfile> createBranch(BranchProfile branchProfile);

  ///upload picture files to branch by token
  Future<Response> uloadBranchProfilePictures(
    List<AppFile> pictureFiles,
  );
}
