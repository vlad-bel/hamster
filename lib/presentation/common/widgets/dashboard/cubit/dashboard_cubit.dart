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
        DashboardState.error(),
      );
    }
  }

  ///test function for demo from other place
  void increaseCount() {
    state.when(
      init: (state) {
        state.testCount ??= 0;
        state.testCount = 3;

        final newState = state.copyWith(testCount: 3);

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
            testCount: testCount,
            finansenOpen: finansenOpen,
            administrationOpen: administrationOpen,
            repCompany: repCompany,
          ),
        );
      },
    );
  }

  void updateRepCompany(
    RepCompany? repCompany,
    BranchProfileWithPaging branchProfilesList,
  ) {
    state.whenOrNull(
      init: (stateObject) {
        final newState = stateObject.copyWith(
          repCompany: repCompany,
          branchProfilesList: branchProfilesList,
        );

        emit(DashboardState.init(stateObject: newState));
      },
    );
  }
}
