import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.init());

  ///test function for demo from other place
  void increaseCount() {
    state.when(
      init: (testCount) {
        testCount ??= 0;

        testCount++;
        emit(DashboardState.init(testCount: testCount));
      },
    );
  }
}
