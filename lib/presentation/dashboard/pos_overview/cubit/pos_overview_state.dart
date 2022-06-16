import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_overview_state.freezed.dart';

@freezed
class PosOverviewState with _$PosOverviewState {
  const factory PosOverviewState.initial() = _$InitalPosOverviewState;

  const factory PosOverviewState.success(
    BranchProfileWithPaging branchProfileWithPaging,
  ) = _$SuccessPosOverviewState;
}
