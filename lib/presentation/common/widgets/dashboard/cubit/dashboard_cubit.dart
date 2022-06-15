import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.loginUseCase,
  }) : super(
          DashboardState.init(
            stateObject: DashboardStateObject(),
          ),
        );

  final LoginUseCase loginUseCase;

  void logout() {
    try {
      loginUseCase.logout();
    } catch (e) {
      emit(
        const DashboardState.error(),
      );
    }
  }

  ///test function for demo from other place
  void increaseCount(int count) {
    state.when(
      init: (state) {
        final newState = state.copyWith(testCount: count);

        emit(DashboardState.init(stateObject: newState));
      },
      error: (
        int? testCount,
        bool? finansenOpen,
        bool? administrationOpen,
        RepCompany? repCompany,
      ) {
        emit(
          DashboardState.error(
            testCount: count,
            finansenOpen: finansenOpen,
            administrationOpen: administrationOpen,
            repCompany: repCompany,
          ),
        );
      },
    );
  }

  void updateRepCompany({
    RepCompany? repCompany,
    BranchProfileWithPaging? branchProfilesList,
  }) {
    final branches = branchProfilesList?.getPrintableString();
    logger.d(branches);

    state.whenOrNull(
      init: (stateObject) {
        final newState = stateObject.copyWith(
          repCompany: repCompany,
          branchProfilesList: branchProfilesList,
        );

        emit(DashboardState.init(stateObject: newState));

        calculateMyCompanyFillingCount(
          branchProfilesList?.data,
          repCompany,
        );
      },
    );
  }

  void calculateMyCompanyFillingCount(
    List<BranchProfile>? branchProfileList,
    RepCompany? repCompany,
  ) {
    var fillingCount = 0;
    if (repCompany?.company?.fillingProgress != null) {
      if (repCompany!.company!.fillingProgress! < 100) {
        fillingCount++;
      }
    }

    if (branchProfileList != null) {
      for (final branch in branchProfileList) {
        if (branch.fillingProgress != null) {
          if (branch.fillingProgress! < 100) {
            fillingCount++;
          }
        }
      }
    }

    increaseCount(fillingCount);
  }
}
