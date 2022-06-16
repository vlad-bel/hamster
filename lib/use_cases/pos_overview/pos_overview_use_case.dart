import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';

// ignore: one_member_abstracts
abstract class PosOverviewUseCase {
  Future<BranchProfileWithPaging> getData({
    required int page,
  });
}
