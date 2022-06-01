import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BranchProfileUseCase)
class BranchProfileUseCaseImpl extends BranchProfileUseCase {
  BranchProfileUseCaseImpl(this._repository);

  final RestClient _repository;

  @override
  Future<BranchProfile> createBranch(BranchProfile branchProfile) async {
    final branchJson = branchProfile.toJson();

    final response = await _repository.createBranch(branchJson);
    return response;
  }

  @override
  Future<BranchProfile> getBranchById(String id) async {
    final response = await _repository.getBranchById(id);
    return response;
  }

  @override
  Future<BranchProfileWithPaging> getBranchesListByRepresentative() async {
    // final response = await _repository.getBranchesByRepresentative();

    // TODO: mock
    final branchProfile = [
      BranchProfile(
        branchName: 'Branch name',
        branchNumber: '1111',
        city: 'City',
        entrances: 1,
      ),
    ];

    final response = BranchProfileWithPaging(
        hasNextPage: false,
        hasPreviousPage: false,
        itemCount: 1,
        page: 1,
        order: 'DESC',
        pageCount: 1,
        take: 1,
        data: branchProfile,);
    return response;
  }

  @override
  Future<BranchProfile> updateBranchById(
    String id,
    BranchProfile branchProfile,
  ) async {
    final branchJson = branchProfile.toJson();

    final response = await _repository.updateBranchById(id, branchJson);
    return response;
  }
}
