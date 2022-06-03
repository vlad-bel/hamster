import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:dio/dio.dart';

abstract class BranchProfileUseCase {
  Future<BranchProfileWithPaging> getBranchesListByRepresentative();

  Future<BranchProfile> getBranchById(String id);

  Future<BranchProfile> updateBranchById(
    String id,
    BranchProfile branchProfile,
  );

  Future<BranchProfile> createBranch(BranchProfile branchProfile);

  Future<Response> uloadBranchProfilePictures(
    List<AppFile> pictureFiles,
  );
}
