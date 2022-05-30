import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BranchProfileUseCase)
class BranchProfileUseCaseImpl extends BranchProfileUseCase {
  BranchProfileUseCaseImpl(this._repository, this._tokenRepository);

  final RestClient _repository;
  final TokenRepository _tokenRepository;

  @override
  Future<BranchProfile> createBranch(BranchProfile branchProfile) {
    // TODO: implement createBranch
    throw UnimplementedError();
  }

  @override
  Future<BranchProfile> getBranchById(String id) {
    // TODO: implement getBranchById
    throw UnimplementedError();
  }

  @override
  Future<BranchProfile> getBranchByRepresentative() {
    // TODO: implement getBranchByRepresentative
    throw UnimplementedError();
  }

  @override
  Future<BranchProfile> updateBranchById(String id) {
    // TODO: implement updateBranchById
    throw UnimplementedError();
  }
}
