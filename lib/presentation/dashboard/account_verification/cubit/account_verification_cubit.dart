import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/use_cases/company/branch_profile/branch_profile_use_case.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_verification_cubit.freezed.dart';

@Singleton()
class AccountVerificationCubit extends Cubit<VerifyAccountState> {
  AccountVerificationCubit({
    required this.companyUsecase,
    required this.branchProfileUseCase,
    required this.dashboardCubit,
  }) : super(
          const VerifyAccountState.initial(
            isFullyCompleted: false,
          ),
        );

  final CompanyUsecase companyUsecase;
  final BranchProfileUseCase branchProfileUseCase;

  final DashboardCubit dashboardCubit;

  Future getRepCompanyData() async {
    try {
      final repCompany = await companyUsecase.getRepCompany();
      final branchProfiles =
          await branchProfileUseCase.getBranchesListByRepresentative();

      dashboardCubit.updateRepCompany(
        repCompany: repCompany,
        branchProfilesList: branchProfiles,
      );
      state.whenOrNull(
        initial: (isFullyCompleted, __, ___, ____) {
          emit(
            VerifyAccountState.initial(
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

  final fullyCompleted = 100;

  bool isFullyCompleted(RepCompany repCompany) {
    return repCompany.rep?.fillingProgress == fullyCompleted &&
        repCompany.company?.fillingProgress == fullyCompleted &&
        repCompany.branch?.fillingProgress == fullyCompleted;
  }
}

@freezed
class VerifyAccountState with _$VerifyAccountState {
  const factory VerifyAccountState.initial({
    bool? isFullyCompleted,
    int? progressUserAccount,
    int? progressCompanyProfile,
    int? progressBranchProfile,
  }) = InitialAccountVerificationState;

  const factory VerifyAccountState.error({
    required ApiFailure error,
  }) = ErrorAccountVerificationState;
}
