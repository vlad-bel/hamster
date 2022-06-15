import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/presentation/dashboard/pos_overview/cubit/pos_overview_state.dart';
import 'package:business_terminal/use_cases/pos_overview/pos_overview_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class PosOverviewCubit extends Cubit<PosOverviewState> {
  PosOverviewCubit(this._posOverviewUseCase)
      : super(
          const PosOverviewState.initial(),
        );

  final PosOverviewUseCase _posOverviewUseCase;

  Future<void> getData({int page = 1}) async {
    final branchProfileWithPaging = await _getDataByPage(
      page: page,
    );
    emit(
      PosOverviewState.success(branchProfileWithPaging),
    );
  }

  Future<BranchProfileWithPaging> _getDataByPage({required int page}) async {
    final branchProfileWithPaging = await _posOverviewUseCase.getData(
      page: page,
    );
    return branchProfileWithPaging;
  }
}
