import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.init({
    required DashboardStateObject stateObject,
  }) = InitDashboardState;

  const factory DashboardState.error({
    int? testCount,
    bool? finansenOpen,
    bool? administrationOpen,
    RepCompany? repCompany,
  }) = ErrorDashboardState;
}

class DashboardStateObject {
  int? testCount;
  bool? finansenOpen;
  bool? administrationOpen;
  RepCompany? repCompany;
  List<BranchProfile>? branchProfilesList;

  DashboardStateObject({
    this.testCount = 0,
    this.finansenOpen = false,
    this.administrationOpen = false,
    this.repCompany,
    this.branchProfilesList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardStateObject &&
          runtimeType == other.runtimeType &&
          testCount == other.testCount &&
          finansenOpen == other.finansenOpen &&
          administrationOpen == other.administrationOpen &&
          repCompany == other.repCompany &&
          branchProfilesList == other.branchProfilesList;

  @override
  int get hashCode =>
      testCount.hashCode ^
      finansenOpen.hashCode ^
      administrationOpen.hashCode ^
      repCompany.hashCode ^
      branchProfilesList.hashCode;

  DashboardStateObject copyWith({
    int? testCount,
    bool? finansenOpen,
    bool? administrationOpen,
    RepCompany? repCompany,
    List<BranchProfile>? branchProfilesList,
  }) {
    return DashboardStateObject(
      testCount: testCount ?? this.testCount,
      finansenOpen: finansenOpen ?? this.finansenOpen,
      administrationOpen: administrationOpen ?? this.administrationOpen,
      repCompany: repCompany ?? this.repCompany,
      branchProfilesList: branchProfilesList ?? this.branchProfilesList,
    );
  }
}
