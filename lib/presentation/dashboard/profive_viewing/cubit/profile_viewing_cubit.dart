import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_viewing_cubit.freezed.dart';

@Singleton()
class ProfileViewingCubit extends Cubit<ProfileViewingState> {
  ProfileViewingCubit({
    required this.companyUseCase,
  }) : super(
          const ProfileViewingState.initial(),
        );

  final CompanyUsecase companyUseCase;

  Future<void> getInitialData() async {
    try {
      emit(
        const ProfileViewingState.loading(),
      );
      final repCompany = await companyUseCase.getRepCompany();
      final company = await companyUseCase.getCompany(
        companyId: repCompany.company?.id ?? '',
      );
      emit(
        ProfileViewingState.success(
          repCompany: repCompany,
          company: company,
        ),
      );

      return;
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(
        ProfileViewingState.error(
          error: e,
        ),
      );
    }
  }
}

@freezed
class ProfileViewingState with _$ProfileViewingState {
  const factory ProfileViewingState.error({
    required ApiFailure error,
  }) = ErrorProfileViewingState;

  const factory ProfileViewingState.initial() = InitialProfileViewingState;

  const factory ProfileViewingState.loading() = LoadingProfileViewingState;

  const factory ProfileViewingState.success({
    required RepCompany repCompany,
    required Company company,
  }) = SuccessProfileViewingState;
}
