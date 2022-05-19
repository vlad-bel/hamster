import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../use_cases/profile/profile_edit/profile_edit_use_case.dart';

part 'profile_edit_cubit.freezed.dart';

@singleton
class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit({
    required this.profileEditUsecase,
  }) : super(
          const ProfileEditState.initial(),
        );

  final ProfileEditUsecase profileEditUsecase;

  // TODO Implement functionality
  Future editProfile() async {
    try {
      await profileEditUsecase.editProfile();

      state.whenOrNull(
        initial: () {
          emit(
            const ProfileEditState.initial(),
          );
        },
      );
    } on ApiFailure catch (e) {
      logger.e(e.response.message);
      emit(ProfileEditState.error(error: e));
    }
  }
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.error({
    required ApiFailure error,
  }) = ErrorProfileEditState;

  const factory ProfileEditState.initial() = InitialProfileEditState;
}
