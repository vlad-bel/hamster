import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_verification_cubit.freezed.dart';

@singleton
class AccountVerificationCubit extends Cubit<VerifyAccountState> {
  AccountVerificationCubit({
    required this.companyUsecase,
    required this.dashboardCubit,
  }) : super(
          const VerifyAccountState.initial(
            isAcceptedDataIsCorrect: false,
            isFullyCompleted: false,
          ),
        );

  final CompanyUsecase companyUsecase;
  final DashboardCubit dashboardCubit;

  Future getRepCompanyData() async {
    try {
      final repCompany = await companyUsecase.getRepCompany();

      dashboardCubit.updateRepCompany(repCompany);
      state.whenOrNull(
        initial: (isAcceptedDataIsCorrect, isFullyCompleted, __, ___, ____) {
          emit(
            VerifyAccountState.initial(
              isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
              isFullyCompleted: isFullyCompleted,
              progressUserAccount: repCompany.rep?.fillingProgress,
              progressCompanyProfile: repCompany.company?.fillingProgress,
              progressBranchProfile: repCompany.branch?.fillingProgress,
            ),
          );
        },
      );
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(VerifyAccountState.error(error: e));
    }
  }

  void changeCheckBoxDataIsCorrect({
    required bool isAcceptedDataIsCorrect,
  }) {
    state.whenOrNull(
      initial: (
        _,
        isFullyCompleted,
        int? progressUserAccount,
        int? progressCompanyProfile,
        int? progressBranchProfile,
      ) {
        emit(
          VerifyAccountState.initial(
            isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
            isFullyCompleted: isFullyCompleted,
            progressUserAccount: progressUserAccount,
            progressCompanyProfile: progressCompanyProfile,
            progressBranchProfile: progressBranchProfile,
          ),
        );
      },
    );
  }

  bool isFullyCompleted(RepCompany repCompany) {
    const fullyCompleted = 100;

    return repCompany.rep?.fillingProgress == fullyCompleted &&
        repCompany.company?.fillingProgress == fullyCompleted &&
        repCompany.branch?.fillingProgress == fullyCompleted;
  }
}

@freezed
class VerifyAccountState with _$VerifyAccountState {
  const factory VerifyAccountState.initial({
    bool? isAcceptedDataIsCorrect,
    bool? isFullyCompleted,
    int? progressUserAccount,
    int? progressCompanyProfile,
    int? progressBranchProfile,
  }) = InitialAccountVerificationState;

  const factory VerifyAccountState.error({
    required ApiFailure error,
  }) = ErrorAccountVerificationState;
}
