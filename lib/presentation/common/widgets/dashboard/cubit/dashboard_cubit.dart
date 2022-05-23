import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.loginUseCase,
  }) : super(const DashboardState.init());

  final LoginUseCase loginUseCase;

  void logout() {
    try {
      loginUseCase.logout();
    } catch (e) {
      emit(
        DashboardState.error().copyWith(),
      );
    }
  }

  ///test function for demo from other place
  void increaseCount() {
    state.whenOrNull(
      init: (testCount, _, __, ___) {
        testCount ??= 0;

        testCount = 3;
        emit(
          DashboardState.init(
            testCount: testCount,
            administrationOpen: true,
            finansenOpen: true,
          ),
        );
      },
      error: (
        int? testCount,
        bool? finansenOpen,
        bool? administrationOpen,
        RepCompany? repCompany,
      ) {
        emit(
          DashboardState.error().copyWith(),
        );
      },
    );
  }

  void updateRepCompany(
    RepCompany? repCompany,
  ) {
    emit(
      const DashboardState.init().copyWith(
        repCompany: repCompany,
      ),
    );
  }
}
