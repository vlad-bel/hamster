import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:business_terminal/use_cases/profile/profile_viewing/profile_viewing_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_viewing_cubit.freezed.dart';

@Singleton()
class ProfileViewingCubit extends Cubit<ProfileViewingState> {
  ProfileViewingCubit({
    required this.profileViewingUsecase,
  }) : super(
          const ProfileViewingState.initial(),
        );

  final ProfileViewingUsecase profileViewingUsecase;

  Future<void> getInitialData() async {
    try {
      emit(
        const ProfileViewingState.loading(),
      );
      final repCompany = await getIt.get<CompanyUsecase>().getRepCompany();
      emit(
        ProfileViewingState.success(
          repCompany: repCompany,
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
  }) = SuccessProfileViewingState;
}
